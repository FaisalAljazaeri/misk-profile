class AddSummaryToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :summary, :string
  end
end
