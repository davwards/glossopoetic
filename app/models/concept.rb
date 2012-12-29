class Concept < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :description

  validates :name, presence: true, uniqueness: {scope: :project_id}
  validates :project_id, presence: true
end
