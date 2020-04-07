class AddLinkedinLinkToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :linkedin_link, :string
  end
end
