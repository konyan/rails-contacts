class ContactsController < ApplicationController

  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Group.find(params[:group_id]).contacts.order(created_at: :desc).page(params[:page])
    else
      @contacts = Contact.order(created_at: :desc).page(params[:page])
    end

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:succsss] = "Contact was successfully created."
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:succsss] = "Contact was successfully updated."
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:succsss] = "Contact was successfully destroy."
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:company, :address, :phone, :group_id)
  end
end
