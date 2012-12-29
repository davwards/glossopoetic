require 'spec_helper'

describe Project do

  it "has a valid factory" do
    FactoryGirl.build(:project).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:project, name: nil).should_not be_valid
  end

  it "is invalid with a duplicate name" do
    popular_name = "ProjectA"
    FactoryGirl.create(:project, name: popular_name)
    FactoryGirl.build(:project, name: popular_name).should_not be_valid
  end
end
