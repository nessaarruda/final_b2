require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'relationships' do
    it { should have_many :enrollments}
    it { should have_many(:students).through(:enrollments) }
  end
  describe 'class methods' do
    it 'list students in order by grade' do
      student1 = Student.create!(name: 'Hermione Granger')
      student2 = Student.create!(name: 'Ron Wisley')
      student3 = Student.create!(name: 'Harry Potter')
      course1 = Course.create!(name: 'Potions')
      course2 = Course.create!(name: 'Defense Agains the Dark Arts')
      course3 = Course.create!(name: 'Herbology')
      Enrollment.create!(student_id: student1.id, course_id: course1.id, grade: 'A')
      Enrollment.create!(student_id: student1.id, course_id: course2.id, grade: 'B')
      Enrollment.create!(student_id: student1.id, course_id: course3.id, grade: 'C')
      Enrollment.create!(student_id: student2.id, course_id: course1.id, grade: 'B')
      Enrollment.create!(student_id: student2.id, course_id: course2.id, grade: 'A')
      Enrollment.create!(student_id: student2.id, course_id: course3.id, grade: 'A')
      Enrollment.create!(student_id: student3.id, course_id: course1.id, grade: 'C')
      Enrollment.create!(student_id: student3.id, course_id: course2.id, grade: 'C')
      Enrollment.create!(student_id: student3.id, course_id: course3.id, grade: 'B')

      expect(course1.list_students).to eq([student1.name, student2.name, student3.name])
    end
  end
end
