class AddGithubLinkToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :github_link, :string
  end
end
