require "spec_helper"

describe ShowMailer do
  it "should send mails" do
    email = ShowMailer.email_shows.deliver
    assert !ActionMailer::Base.deliveries.empty?
  end
end
