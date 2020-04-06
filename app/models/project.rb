class Project < ApplicationRecord
    belongs_to :student

  # Include an attached image file for each Project
  has_one_attached :project_img
end
