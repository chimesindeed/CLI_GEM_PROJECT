require_relative '../config/environment.rb'
require 'pry'
require 'nokogiri'
require 'open-uri'

class Pulldata
  def scrape
    #Open gets HTML which Nokogiri::HTML parses into array of XML Objects
    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_cookies'))
    
    table_of_cookies = [] #<---DATA SCRAPED FROM WIKIPEDIA - LIST OF COOKIES WILL LIVE HERE
    
    #TR ARE THE ROWS IN THE TABLE WITH THE COOKIE DATA WE'RE INTERESTED IN
    #ITERATE OVER EACH ITEM(table-row) PUSHING IT TO BE STORED AS AN ELEMENT IN table_of_cookies ARRAY
    doc.css('tr').each {|table_row| table_of_cookies << table_row}

    table_of_cookies.shift #GETS RID OF THE FIRST ROW WHICH ISN'T COOKIE DATA

    table_of_cookies.each do |cookie|
    #FOR EACH ELEMENT OF TABLE OF COOKIES
    #Indexes 0, 2 and 3 contain TITLE, ORIGIN and DESCRIPTION of Cookies
    cookie_name          =   cookie.css('td')[0]&.text
    cookie_origin        =   cookie.css('td')[2]&.text
    cookie_description   =   cookie.css('td')[3]&.text
  
    #GETS RID OF ROWS OF THE TABLE WHICH AREN'T COOKIE DATA 
      unless cookie_description == nil || cookie_origin.split.count > 6
  
    #NOW WE HAVE ALL THE DATA WE NEED TO INSTANTIATE EACH COOKIE WITH A NAME, ORIGIN AND DESCRIPTION 
    Alotacookies::Cookie.create(cookie_name, cookie_origin, cookie_description)  
      end #UNLESS CONDITIONAL
    end #TABLE OF COOKIES.EACH
  
  end #SELF.SCRAPE METHOD
  
 end #PULLDATA CLASS
