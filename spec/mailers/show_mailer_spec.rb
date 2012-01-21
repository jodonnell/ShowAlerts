require "spec_helper"

describe ShowMailer do
  before(:each) do
    FactoryGirl.create(:show, :bands => 'Band')
    match = Factory(:show)
    user = Factory(:user)
  end

  it "should send mails" do
    ShowMailer.email_shows
    ActionMailer::Base.deliveries.should_not be_empty
    ActionMailer::Base.deliveries[0].body.parts.find {|p| p.content_type.match /html/}.body.raw_source.should include("M83 on January 20, 2012 at Location.  <a href=\"http://google.com\">Tickets</a>")
  end
end
