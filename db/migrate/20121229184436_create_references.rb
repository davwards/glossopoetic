class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :referencer_id
      t.integer :referencee_id
      t.integer :parent_reference_id
      t.integer :placement

      t.timestamps
    end
  end
end
