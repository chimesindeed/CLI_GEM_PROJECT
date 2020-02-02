require_relative '../config/environment.rb'

module Alotacookies
class Cookie
  #Cookie.create GETS CALLED FROM SCRAPER.RB TO,
  #INSTANTIATE COOKIE OBJECTS WITH @name, @origin AND @description INSTANCE VARIABLES
  #ALL COOKIE INSTANCES WILL LIVE IN Cookie classe's @@all ARRAY WHICH SERVES AS SINGLE SOURCE OF TRUTH

  attr_accessor :name, :origin, :description
  @@all = []
    
  def initialize(name, origin, description)
    @name         =       name
    @origin       =       origin
    @description  =       description
    @@all << self
  end

  def self.all #EXPOSES @@all SO WE CAN ACCESS IT
    @@all
  end

  #GETS CALLED FROM SCRAPER.RB TO INSTANTIATE ALL COOKIE INSTANCES 
  def self.create(name, origin, description)
    title = Cookie.new(name, origin, description)
  end

  #GETS CALLED FROM CLI.RB TO DISPLAY COOKIE NAMES TO USER AS NUMBERED OPTIONS
  def self.display_names
    all.each_with_index {|cookie, index| puts "#{index +1}) " + "#{cookie.name}"}
    puts "Enter number of cookie to get cookie origin and description:"
  end
  
  def self.find_by_name(input)    
result = nil
@@all.each{|cookie|
	puts "cookie name is #{cookie.name.upcase}"
	puts "#{input.upcase}"
	if cookie.name.upcase.strip == input.upcase.strip
	result = cookie.name
	end
	}
result
end

  #GETS CALLED FROM CLI.RB GIVING USER COOKIE INFO 
  def self.display_info(input = gets.chomp)
    if (1..all.count).member?(input.to_i) #IF MORE COOKIES GET ADDED TO WIKI SITE WE'RE SAFE WITH ALL.COUNT AS MAX
      10.times {puts ""}
      puts all[ input.to_i - 1 ].name
      puts all[ input.to_i - 1 ].origin
      puts all[ input.to_i - 1 ].description
      5.times { puts"" }
      Cli.give_user_options
    elsif input == "l" || input =="L"
      the_menu
      
    elsif input == "e" || input =="E"
      puts "Til we meet again, Cookie Monster!..............."
    else Cli.the_menu
    end
  end
end 
end
