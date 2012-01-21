require 'spec_helper'

describe Scraper do
  
  before(:each) do

  end
  
  it "should create aind new instance given a valid attribute" do
    html = File.read("spec/support/omr.html")
    
    scraper = Scraper.new html
    scraper.parse_page.length.should == 559
  end

  it "should work with broken links" do
    bad_html = File.read("spec/support/bad.html")
    
    scraper = Scraper.new bad_html
    scraper.parse_page.length.should == 1
  end
  
end
