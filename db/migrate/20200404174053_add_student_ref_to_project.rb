class AddStudentRefToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :student, foreign_key: true
  end
end
