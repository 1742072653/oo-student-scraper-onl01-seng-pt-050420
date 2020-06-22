require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    student_arr = []
    
    doc.css(".student-card").each do |student|
      new_hash = {
        :name => student.css("h4").text,
        :location => student.css("p").text,
        :profile_url => student.css("a")["href"].to
      }
      student_arr << new_hash
    end
    student_arr
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

