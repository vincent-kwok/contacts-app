class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all.order(id: :asc)

    search_terms = params[:query]
    if search_terms
      contacts = contacts.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%#{search_terms}%", "%#{search_terms}%", "%#{search_terms}%")
    end

    # sort_price = params[:sort_price]
    # if sort_price
    #   products = products.order(price: :asc)
    # else
    #   products = products.order(id: :asc)
    # end

    render json: contacts.as_json
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio]
    )
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find_by(id: params["id"])
    render json: contact.as_json
  end

  def update
    contact = Contact.find_by(id: params["id"])
    contact.first_name = params[:first_name] || contact.first_name
    contact.middle_name = params[:middle_name] || contact.middle_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.bio = params[:bio] || contact.bio
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: {message: "Contact deleted."}
  end
end