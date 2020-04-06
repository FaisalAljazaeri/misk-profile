class Project < ApplicationRecord
    belongs_to :student
    validates :name, :link, :description, presence: true
    validates :description, length: { maximum: 1200 }

  # Include an attached image file for each Project
  has_one_attached :project_img
  # Validation for the Project image
  validates :project_img, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
