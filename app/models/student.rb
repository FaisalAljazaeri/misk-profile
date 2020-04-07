class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Valdiations
  validates :first_name, :last_name, :summary, :course_id, :linkedin_link, presence: true
  validates :summary, length: { maximum: 500 }

  # Include an attached image(avatar) file for each Student
  has_one_attached :avatar
  # Validation for the Student avatar
  validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

    # Validate the formats of Student LinkedIn and GitHub Links
    validates_format_of :linkedin_link, :github_link, :with => URI::regexp(%w(http https))
    before_save :format_url
  
  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills
  belongs_to :course
  has_many :projects, dependent: :destroy

    # Fix Format of URLs before saving to DB
    def format_url
      self.linkedin_link = "http://#{self.linkedin_link}" unless self.linkedin_link[/^https?/]
      self.github_link = "http://#{self.github_link}" unless self.github_link[/^https?/] 
    end
end
