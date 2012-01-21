require 'spec_helper'

describe Show do
  
  before(:each) do
  end
  
  it "should be able to create a show" do
    show = Show.create :bands => 'Band', :date => Date.parse("2012/01/20"), :location => 'Location', :tickets => 'Tickets'
    show.bands.should == 'Band'
  end

end
