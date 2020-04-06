class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Valdiations
  validates :first_name, :last_name, :img, :summary, :course_id, presence: true
  validates :summary, length: { maximum: 500 }

  has_many :student_skills
  has_many :skills, through: :student_skills
  belongs_to :course
  has_many :projects
end
