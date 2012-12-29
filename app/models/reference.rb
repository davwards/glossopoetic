class Reference < ActiveRecord::Base
  belongs_to :referencer, class_name: "Concept"
  belongs_to :referencee, class_name: "Concept"

  validates :referencer_id, presence: true
  validates :referencee_id, presence: true
  validates :placement, uniqueness: true
  attr_accessible :parent_reference_id, :placement, :referencee_id, :referencer_id
end
