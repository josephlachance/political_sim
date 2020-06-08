require "./database.rb"

db = Database.new

while true

  puts "What would you like to do?"
  puts "(C)reate"
  puts "(R)ead"
  puts "(U)pdate"
  puts "(D)elete"
  print "> "

  action = gets.chomp.downcase

  if action == "c"
    puts "Would you like to make (P)olitician or (V)oter"
    print "> "
    type = gets.chomp.downcase

    if type == "p"
      puts "enter name"
      print "> "
      p_name = gets.chomp.capitalize

      puts "enter party"
      print "> "
      p_party = gets.chomp.capitalize

      db.create(type, p_name, p_party)

      puts "#{p_name} from the #{p_party} party as been added"
    elsif type == "v"
      puts "Enter Name"
      print "> "
      v_name = gets.chomp.capitalize

      puts "enter party"
      print "> "
      v_party = gets.chomp.capitalize

      db.create(type, v_name, v_party)

      puts "Hello #{v_name}, of the #{v_party} party. You've been added to the database."
      puts " "
    end
  elsif action == "r"
    puts "Would you like to see (P)olitician or (V)oter?"
    print "> "
    read_type = gets.chomp
    if read_type == "p"
      puts db.read(read_type)
      puts " "
    elsif read_type == "v"
      puts db.read(read_type)
      puts " "
    end
  elsif action == "u"
    puts "Is the name you want to change a Politician or Voter?"
    update_type = gets.chomp.downcase
    if update_type == "p"
      puts "type the name you would like to change"
      p_old_name = gets.chomp
      puts "what is the new name"
      p_new_name = gets.chomp
      db.update(update_type, p_old_name, p_new_name)
    elsif update_type == "v"
      puts "type the name you would like to change"
      v_old_name = gets.chomp
      puts "what is the new name"
      v_new_name = gets.chomp
      db.update(update_type, v_old_name, v_new_name)
    end
  elsif action == "d"
    puts "Is the name you wish to delete a Politician or Voter?"
    delete_type = gets.chomp.downcase
    if delete_type == "p"
      puts "type the name you would like to delete. "
      p_delete = gets.chomp
      db.delete(delete_type, p_delete)
    elsif delete_type == "v"
      puts "type the name you would like to delete. "
      v_delete = gets.chomp
      db.delete(delete_type, v_delete)
    end
  end
end
