


@contact_name = ["Erin", "Carmen", "Ethan"]


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
    exit
  else 
    puts "Invalid Choice"
  end

  user_selection
end

def view_contacts
  seperate
  puts @contact_name
end

def enter_contact
  seperate
  puts "Enter Name"
  name = gets.chomp.to_s
  @contact_name.push(name)
end

def remove_contact
  puts "Which contact would you like to remove?"
  view_contacts
  name = gets.chomp.to_s
  @contact_name.delete(name)
end

def edit_contact
  puts "Which contact would you like to edit?"
  view_contacts
  name1 = gets.chomp.to_s
  puts "You are editing " + name1
  puts "What would you like to edit this name to?"
  edit1 = gets.chomp.to_s
  puts name1 + " has been changed to " + edit1
  @contact_name.delete(name1)
  @contact_name.push(edit1)
end



user_selection
