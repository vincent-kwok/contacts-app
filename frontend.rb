require "unirest"

system "clear"

response = Unirest.get("http://localhost:3000/first_contact")
first_name = response.body["first_name"]
last_name = response.body["last_name"]
email = response.body["email"]
phone_number = response.body["phone_number"]
puts first_name
puts last_name
puts email
puts phone_number