require "unirest"

system "clear"

puts "[1] Show all contacts"
puts "[2] Search by first name"
puts "[3] Sort by price"
puts "[4] Create a contact"
puts "[5] Look up a contact"
puts "[6] Update a contact"
puts "[7] Delete a contact"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/v1/contacts?query=#{search_terms}")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "4"
  params = {}
  print "First Name: "
  params["first_name"] = gets.chomp
  print "Middle Name: "
  params["middle_name"] = gets.chomp
  print "Last Name: "
  params["last_name"] = gets.chomp
  print "Email: "
  params["email"] = gets.chomp
  print "Phone Number: "
  params["phone_number"] = gets.chomp
  print "Bio: "
  params["bio"] = gets.chomp  
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "5"
  print "Enter ID: "
  input_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{input_id}")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "6"
  print "Enter ID to update: "
  input_id = gets.chomp
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{input_id}")
  contact = response.body
  params = {}
  print "Update First Name: "
  params["first_name"] = gets.chomp || contact.first_name
  print "Update Middle Name: "
  params["middle_name"] = gets.chomp || contact.middle_name
  print "Update Last Name: "
  params["last_name"] = gets.chomp || contact.last_name
  print "Update Email: "
  params["email"] = gets.chomp || contact.email
  print "Update Phone Number: "
  params["phone_number"] = gets.chomp || contact.phone_number
  print "Bio: "
  params["bio"] = gets.chomp || contact.bio
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{input_id}", parameters: params)
  updated_contact = response.body
  puts JSON.pretty_generate(updated_contact)
elsif input_option == "7"
  print "Enter ID to delete: "
  input_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/contacts/#{input_id}")
  body = response.body
  puts JSON.pretty_generate(body)
end