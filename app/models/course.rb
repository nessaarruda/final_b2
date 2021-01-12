class Course < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments

  def list_students
    enrollments.order(:grade).map do |enrollment|
      enrollment.student.name
    end
  end
end
