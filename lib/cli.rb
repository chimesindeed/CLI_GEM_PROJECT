require_relative './alotacookies/version.rb'
require_relative './alotacookies.rb'


class Cli

  def self.the_menu
    
    puts ""
    puts ""
    puts ""
    puts ""
    puts " -------------------------------------------- "
    puts "|                                            |"
    puts "|       Are you a Cookie Monster...?         |"
    puts "|    Get ready for some delicious treats.    |"
    puts "|                                            |"
    puts "|    Press L key to get a list of Cookies    |"
    puts "|                                            |"
    puts "|                                            |"
    puts "|    Enter Number of Listed Cookie to get    |"
    puts "|                                            |"
    puts "|  Cookie country of origin and description. |"
    puts " -------------------------------------------- "
    puts ""
    puts ""
    puts ""
    puts ""
    
    give_user_options
  end
  
  def self.give_user_options
    puts "Press L to get your list of cookies...    Press E to exit"
    input = nil
    input = gets.chomp
      if input =="l" || input == "L"
        Alotacookies::Cookie.display_names
        Alotacookies::Cookie.display_info
      elsif input == "e" || input =="E"
        puts "exit"
    else the_menu
      
      end #CONDITIONAL
  end #METHOD
  
end #CLASS
