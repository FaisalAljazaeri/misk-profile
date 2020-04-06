class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Valdiations
  validates :first_name, :last_name, :summary, :course_id, presence: true
  validates :summary, length: { maximum: 500 }

  # Include an attached image(avatar) file for each Student
  has_one_attached :avatar
  # Validation for the Student avatar
  validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  
  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills
  belongs_to :course
  has_many :projects, dependent: :destroy
end
