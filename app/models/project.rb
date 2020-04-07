class Project < ApplicationRecord
    belongs_to :student
    validates :name, :link, :description, presence: true
    validates :description, length: { maximum: 1200 }

    # Include an attached image file for each Project
    has_one_attached :project_img
    # Validation for the Project image
    validates :project_img, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

    # Validate that the formats of Project Link and GitHub_Link
    validates_format_of :link, :github_link, :with => URI::regexp(%w(http https))
    before_save :format_url

    # Fix Format of URLs before saving to DB
    def format_url
      self.link = "http://#{self.link}" unless self.link[/^https?/]
      self.github_link = "http://#{self.github_link}" unless self.github_link[/^https?/] 
    end
end
