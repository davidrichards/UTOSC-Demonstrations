require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Route do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :day_list => "value for day_list",
      :direction => "value for direction",
      :mode_id => 1,
      :region_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Route.create!(@valid_attributes)
  end
end
