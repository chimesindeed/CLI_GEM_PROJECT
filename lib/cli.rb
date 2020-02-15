require_relative '../config/environment.rb'

module Alotacookies
  class Cli

    def initialize
      Pulldata.new.scrape
      self.class.the_menu
    end

    def self.the_menu
      puts ""
      puts ""
      puts ""
      puts ""
      puts " ----------------------------------------------------"
      puts "|                                                   |"
      puts "|       Are you a Cookie Monster...?                |"
      puts "|    Get ready for some delicious treats.           |"
      puts "|                                                   |"
      puts "|    Press L key to get a list of Cookies           |"
      puts "|                                                   |"
      puts "|                                                   |"
      puts "|    Enter Number of Listed Cookie to get           |"
      puts "|                                                   |"
      puts "|  Cookie country of origin and description.        |"
      puts " ----------------------------------------------------"
      puts ""
      puts ""
      puts ""
      puts ""
      give_user_options
    end

    def self.give_user_options
      puts "Press L to get your list of cookies...    Press E to exit"
      give_user_choice(for_main_menu)
    end

    def self.give_user_choice(method)
      if method == for_main_menu
        self.for_main_menu
      elsif method == for_cookie_list
        self.for_cookie_list
      end

    end
    def self.for_main_menu(choice = gets.chomp)
      if choice.downcase == "l"
        Cli.get_cookie_list
      elsif choice.downcase == "e"
        exit_app
      else the_menu
      end
    end

    def self.for_cookie_list(choice = gets.chomp)
      case choice
        when choice.downcase == "e"
          Cli.exit_app
        when choice.downcase == "m"
          Cli.the_menu
        else Cookie.display_info(choice)
          give_user_options
        end
    end

    private
    def self.get_cookie_list
      Cookie.display_cookies
      puts "Enter number of cookie to get cookie origin and description:"
      give_user_choice(for_cookie_list)
    end
    private
    def self.exit_app
      exit
    end
end
end
