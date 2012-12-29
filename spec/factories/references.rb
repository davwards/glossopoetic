# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reference do
    referencer_id 1
    referencee_id 1
    parent_reference_id 1
    placement 1
  end
end
