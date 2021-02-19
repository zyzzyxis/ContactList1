#build a contact list
#create a menu that allows to 
    #create a contact   
    #view all contacts
    #exit
#menu should loop until user exits

@hash_arr = [{
  a: "fname:",
  b: "lname:",
  c: "phone:"
}]

@contacts = [
{ fname: "Erin", lname: "Zimm", phone: "801-687-8892"},
{ fname: "Ethan", lname: "Com", phone: "801-777-5555"},
{ fname: "Scott", lname: "Steb", phone: "927-111-1200"}
]

def seperate
  puts "-------------"
end

def menu
  seperate
  puts "Please select one of the following"
  puts "1) View All Contacts"
  puts "2) Enter A Contact"
  puts "3) Remove A Contact"
  puts "4) Edit A Contact"
  puts "5) Exit"
end

def user_selection
  menu
  choice = gets.to_i
  case choice
  when 1
    view_contacts
  when 2
    enter_contact
  when 3
    remove_contact
  when 4
    edit_contact
  when 5
    puts seperate
    puts "Goodbye!"
    exit
  else 
    puts "Invalid Choice"
  end

  user_selection
end

def view_contacts
  seperate
  @contacts.each_with_index do |contact, i|
    print "#{i + 1}: "
    print "#{contact[:fname]} #{contact[:lname]}"
    puts ",  #{contact[:phone]}"
  end
end

def enter_contact
  seperate
  puts "Enter First Name"
  first_name = gets.chomp.to_s
  puts "Enter Last Name"
  last_name = gets.chomp.to_s
  puts "Enter the Phone Number"
  phone_num = gets.chomp.to_s
  contact_hash = {:fname => first_name, :lname => last_name, :phone => phone_num}
  @contacts.push(contact_hash)
end

def remove_contact
  seperate
  puts "Which contact would you like to remove?"
  view_contacts
  index = gets.chomp.to_i - 1
  @contacts.delete_at(index)
  seperate
  puts "The selected contact has been deleted"
end

# def edit_contact
#   puts "Which contact would you like to edit?"
#   view_contacts
#   selected_contact = gets.chomp.to_i - 1
#   contact = @contacts[selected_contact]
#   puts "Please Enter the Contact Information:"
#   @contacts.delete_at(selected_contact)
#   enter_contact
# end

def edit_contact
  puts "Which contact would you like to edit?"
  view_contacts
  index = gets.chomp.to_i 
  puts "Would you like to change the name or the phone number? (name/phone)"
  answer_name = gets.chomp
    if answer_name == "name"
      edit_name(index)
    elsif answer_name == "phone"
      edit_phone(index)
    else
      puts "Invalid entry"
    end
end

def edit_name(index)
  puts "What would you like to change the first name to?"
  new_fname = gets.chomp
  @contacts[index - 1][:fname] = new_fname
  puts "What would you like to change the last name to?"
  new_lname = gets.chomp
  @contacts[index - 1][:lname] = new_lname
end

def edit_phone(index)
  puts "What would you like to change the number to?"
  new_phone = gets.chomp
  @contacts[index - 1][:phone] = new_phone
end

user_selection

