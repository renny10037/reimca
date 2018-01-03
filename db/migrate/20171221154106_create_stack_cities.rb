class CreateStackCities < ActiveRecord::Migration
  def change
    create_table :stack_cities do |t|
      t.string :name
      t.string :stack_state_id

      t.timestamps null: false
    end
  end
end
