class Contact < ApplicationRecord
  belongs_to :group

  validates :name, :email, :group_id, presence:true
  validates :name, length: {minimum: 2}

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  scope :search, -> (term) do
    where("name LIKE :term or company LIKE :term or email LIKE :term ",
      term: "%#{term}%") if term.present?
  end

  # def self.search(term)
  #   if term && !term.empty?
  #     where("name LIKE ?","%#{term}%")
  #   else
  #     all
  #   end
  # end

  scope :by_group, ->(group_id) {  where(group_id: group_id) if group_id.present? }

  # def self.by_group(group_id)
  #   if group_id && !group_id.empty?
  #     where(group_id: group_id)
  #   else
  #     all
  #   end
  # end
end
