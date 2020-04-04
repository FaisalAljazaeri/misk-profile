class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.string :description
      t.string :img

      t.timestamps
    end
  end
end
