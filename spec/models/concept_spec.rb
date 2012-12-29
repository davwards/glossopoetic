require 'spec_helper'

describe Concept do
  it "has a valid factory" do
    FactoryGirl.build(:concept).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:concept, name: nil).should_not be_valid
  end

  it "is invalid with a duplicate name on the same project" do
    project = FactoryGirl.create(:project)
    popular_name = "ConceptA"
    FactoryGirl.create(:concept, project: project, name: popular_name)
    FactoryGirl.build(:concept, project: project, name: popular_name).should_not be_valid
  end

  it "is valid with a duplicate name on a different project" do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    popular_name = "ConceptA"
    FactoryGirl.create(:concept, project: project1, name: popular_name)
    FactoryGirl.build(:concept, project: project2, name: popular_name).should be_valid
  end

  it "is invalid without a project" do
    FactoryGirl.build(:concept, project: nil).should_not be_valid
  end
end
