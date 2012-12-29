class Reference < ActiveRecord::Base
  belongs_to :referencer, class_name: "Concept"
  belongs_to :referencee, class_name: "Concept"
  belongs_to :parent_reference, class_name: "Reference"

  validates :referencer_id, presence: true
  validates :referencee_id, presence: true
  validates :placement, uniqueness: {scope: [:referencer_id, :parent_reference_id]}
  attr_accessible :placement
end
