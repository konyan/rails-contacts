class ContactsController < ApplicationController

  def index
    @contacts = Contact.page.per(10)

  end
end
