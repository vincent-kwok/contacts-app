class ContactsController < ApplicationController
  def first_contact
    contact = Contact.first
    render json: contact.as_json
  end

  def all_contacts
    contacts = Contact.all.sort
    render json: contacts.as_json
  end
end