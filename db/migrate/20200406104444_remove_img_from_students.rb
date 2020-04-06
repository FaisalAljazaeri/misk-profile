class RemoveImgFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :img, :string
  end
end
