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

  it "is invalid with a duplicate placement on the same referencer" do
    referencer = FactoryGirl.create(:concept)
    popular_placement = 1
    FactoryGirl.create(:reference, referencer: referencer, placement: popular_placement)
    FactoryGirl.build(:reference, referencer: referencer, placement: popular_placement).should_not be_valid
  end

  it "is valid with a duplicate placement on a different parent reference" do
    referencer = FactoryGirl.create(:concept)
    parent1 = FactoryGirl.create(:reference, referencer: referencer)
    parent2 = FactoryGirl.create(:reference, referencer: referencer)
    popular_placement = 1
    FactoryGirl.create(:reference, referencer: referencer, parent_reference: parent1, placement: popular_placement)
    FactoryGirl.build(:reference, referencer: referencer, parent_reference: parent2, placement: popular_placement).should be_valid
  end

  it "is valid with a duplicate placement on a different referencer" do
    referencer1 = FactoryGirl.create(:concept)
    referencer2 = FactoryGirl.create(:concept)
    popular_placement = 1
    FactoryGirl.create(:reference, referencer: referencer1, placement: popular_placement)
    FactoryGirl.build(:reference, referencer: referencer2, placement: popular_placement).should be_valid
  end
end
