class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.text :name
      t.text :description
      t.integer :project_id

      t.timestamps
    end
  end
end
