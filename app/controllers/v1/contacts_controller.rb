class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all.sort
    render json: contacts.as_json
  end

  def create
    
  end

  def show
    contact = Contact.params["id"]
    render json: contact.as_json
  end

  def update

  end

  def destroy

  end
end