require 'spec_helper'

describe Scraper do
  
  before(:each) do

  end
  
  it "should be able to parse pages correctly" do
    html = File.read("spec/support/omr.html")
    
    scraper = Scraper.new html
    scraper.parse_page.length.should == 11
  end

  it "should work with broken links" do
    bad_html = File.read("spec/support/bad.html")
    
    scraper = Scraper.new bad_html
    scraper.parse_page.length.should == 1
  end

  it "should handle shows that it already has seen" do
    html = File.read("spec/support/omr.html")
    
    scraper = Scraper.new html
    scraper.parse_page.length.should == 11
    scraper.parse_page.length.should == 11
  end

end
