require "unirest"

system "clear"

puts "[1] Show all contacts"
puts "[2] Create a contact"
puts "[3] Look up a contact"
puts "[4] Update a contact"
puts "[5] Delete a contact"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "2"
  params = {}
  print "First Name: "
  params["first_name"] = gets.chomp
  print "Last Name: "
  params["last_name"] = gets.chomp
  print "Email: "
  params["email"] = gets.chomp
  print "Phone Number: "
  params["phone_number"] = gets.chomp  
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "3"
  print "Enter ID: "
  input_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{input_id}")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "4"
  print "Enter ID to update: "
  input_id = gets.chomp
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{input_id}")
  contact = response.body
  params = {}
  print "Update First Name: "
  params["first_name"] = gets.chomp
  print "Update Last Name: "
  params["last_name"] = gets.chomp
  print "Update Email: "
  params["email"] = gets.chomp
  print "Update Phone Number: "
  params["phone_number"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{input_id}", parameters: params)
  updated_contact = response.body
  puts JSON.pretty_generate(updated_contact)
elsif input_option == "5"
  print "Enter ID to delete: "
  input_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/contacts/#{input_id}")
  body = response.body
  puts JSON.pretty_generate(body)
end