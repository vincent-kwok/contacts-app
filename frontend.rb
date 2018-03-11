require "unirest"

system "clear"

puts "[1] Show all contacts"
puts "[2] Create a contact"
puts "[3] Look up a contact"
puts "[4] Update a contact"
puts "[5] Delete a contact"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/first_contact")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "2"
  response = Unirest.post("http://localhost:3000/v1/all_contacts")
  contacts = response.body
  puts JSON.pretty_generate(contacts)
elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/v1/first_contact")
elsif input_option == "4"
  response = Unirest.patch("http://localhost:3000/v1/first_contact")
elsif input_option == "5"
  response = Unirest.delete("http://localhost:3000/v1/first_contact")
end