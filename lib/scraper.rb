require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_arr = []
    
    doc.css(".student-card").each do |student|
      new_hash = {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a").attribute("href").value
      }
      student_arr << new_hash
    end
    student_arr
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    student_hash = {}
    doc.css(".social-icon-container").each do |social|
      if social.css("a").attribute("href").value.include?("linkedin")
        student[:linkedin] = social.css("a").attribute("href").value
      elsif social.css("a").attribute("href").value.include?("twitter")
      student[:twitter] = social.css("a").attribute("href").value
      elsif social.css("a").attribute("href").value.include?("github")
      student[:github] = social.css("a").attribute("href").value
    
  end

end


