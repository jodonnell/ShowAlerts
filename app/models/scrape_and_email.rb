require 'open-uri'

class ScrapeAndEmail
  def self.run
    scraper = Scraper.new(open('http://www.ohmyrockness.com/showlist.cfm?p=all&by=date'))
    scraper.parse_page
    ShowMailer.email_shows
  end
end
