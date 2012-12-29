class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  attr_accessible :description, :name
end
