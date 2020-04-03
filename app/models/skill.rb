class Skill < ApplicationRecord
    has_many :student_skills
    has_many :students, through: :student_skills

    # Query to find to find Skills that are not selected by a given Student
    def self.unselected_by(student)
        includes(:student_skills)
        .references(:student_skills)
        .where.not(student_skills: { student_id: student.id })
    end
end
