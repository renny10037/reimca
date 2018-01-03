class CreateTypeProjects < ActiveRecord::Migration
  def change
    create_table :type_projects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
