class Project < ApplicationRecord
    belongs_to :student
    validates :name, :link, :description, presence: true
    validates :description, length: { maximum: 1200 }

    # Include an attached image file for each Project
    has_one_attached :project_img
    # Validation for the Project image
    validates :project_img, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

    # Validate that the formats of Project Link and GitHub_Link
    validates_format_of :link, :with => URI::regexp(%w(http https))
    validates_format_of :github_link, :with => URI::regexp(%w(http https)), allow_blank: true
end
