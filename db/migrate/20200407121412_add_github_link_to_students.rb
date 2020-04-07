class AddGithubLinkToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :github_link, :string
  end
end
