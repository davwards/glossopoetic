class Concept < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :description

  validates :name, presence: true, uniqueness: true
  validates :project_id, presence: true
end
