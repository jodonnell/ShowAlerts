require 'nokogiri'
require 'open-uri'


class Scraper

  def initialize html
    @doc = Nokogiri::HTML(html) # open('http://www.ohmyrockness.com/showlist.cfm?p=all&by=date')
  end

  def parse_page
    shows = @doc.css('div.vevent').collect do |concert_block|
      @concert_block = concert_block
      next if bands.nil? or date.nil? or location.nil?
      
      show = Show.where(:bands => bands, :date => date, :location => location, :ticket_link => ticket_link)
      show.create if show.first.nil?
    end
    shows.compact
  end

  def bands
    @concert_block.css('div.bands').inner_text
  end

  def date
    date = @concert_block.css('div.date span.value-title')
    return nil if date.first.nil?
    Date.parse(date.first.attributes["title"].value)
  end

  def location
    venue = @concert_block.css('div.venue a')
    return nil if venue.first.nil?
    venue.first.inner_text
  end

  def ticket_link
    tickets = @concert_block.css('div.tickets a')
    return nil if tickets.first.nil?
    tickets.first.to_html
  end
end

