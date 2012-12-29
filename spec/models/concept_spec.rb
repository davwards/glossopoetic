require 'spec_helper'

describe Concept do
  it "has a valid factory" do
    FactoryGirl.build(:concept).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:concept, name: nil).should_not be_valid
  end

  it "is invalid with a duplicate name" do
    popular_name = "ConceptA"
    FactoryGirl.create(:concept, name: popular_name)
    FactoryGirl.build(:concept, name: popular_name).should_not be_valid
  end

  it "is invalid without a project" do
    FactoryGirl.build(:concept, project: nil).should_not be_valid
  end
end
