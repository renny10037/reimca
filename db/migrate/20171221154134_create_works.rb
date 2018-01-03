class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.string :stack_state_id
      t.string :stack_city_id
      t.string :type_project_id
      t.string :contractor
      t.string :duration
      t.string :image

      t.timestamps null: false
    end
  end
end
