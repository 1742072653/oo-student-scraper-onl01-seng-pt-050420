require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    student_arr = []
    
    doc.css(".student-card").each do |student|
      new_hash = {
        :name => student.css(".student-name").text
        :location => student.css(".student-location").text 
        :profile_url => student.css("a")['href']
      }
      end
      student_arr << new_hash
    end
    student_arr
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

