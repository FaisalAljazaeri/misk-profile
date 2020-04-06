class RemoveImgFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :img, :string
  end
end
