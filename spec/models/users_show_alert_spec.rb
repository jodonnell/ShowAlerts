require 'spec_helper'

describe UsersShowAlert do
  
  before(:each) do
    Show.create :bands => 'Band', :date => Date.parse("2012/01/20"), :location => 'Location', :tickets => 'Tickets'
    match = Show.create :bands => 'M83', :date => Date.parse("2012/01/20"), :location => 'Location', :tickets => 'Tickets'

    user = User.create!({ 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    })

    user.bands.create(:name => 'M83')
  end
  
  it "should be able to find show matches" do
    matches = UsersShowAlert.find_matches
    matches.count.should == 1
  end

    it "should be able to find show matches just once" do
    UsersShowAlert.find_matches
    matches = UsersShowAlert.find_matches
    matches.count.should == 0
    UsersShowAlert.count.should == 1
  end

end
