Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/first_contact" => "contacts#first_contact"
  get "/all_contacts" => "contacts#all_contacts"  
end