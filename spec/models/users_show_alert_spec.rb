require 'spec_helper'

describe UsersShowAlert do
  
  before(:each) do
    FactoryGirl.create(:show, :bands => 'Band')
    match = Factory(:show)
    user = Factory(:user)
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
