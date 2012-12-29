require 'spec_helper'

describe Reference do
  it "has a valid factory" do
    FactoryGirl.build(:reference).should be_valid
  end

  it "is invalid without a referencer" do
    FactoryGirl.build(:reference, referencer: nil).should_not be_valid
  end

  it "is invalid without a referencee" do
    FactoryGirl.build(:reference, referencee: nil).should_not be_valid
  end

  it "is invalid with a duplicate placement" do
    popular_placement = 1
    FactoryGirl.create(:reference, placement: popular_placement)
    FactoryGirl.build(:reference, placement: popular_placement).should_not be_valid
  end
end
