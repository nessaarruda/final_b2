require 'rails_helper'

describe 'As a visitor when I visit courses index page' do
  it 'All courses name, list of students in order of highest to lowest grade' do
    student1 = Student.create!(name: 'Hermione Granger')
    student2 = Student.create!(name: 'Ron Wisley')
    student3 = Student.create!(name: 'Harry Potter')
    course1 = Course.create!(name: 'Potions')
    course2 = Course.create!(name: 'Defense Agains the Dark Arts')
    course3 = Course.create!(name: 'Herbology')
    Enrollment.create!(student_id: student1.id, course_id: course1.id, grade: 'A')
    Enrollment.create!(student_id: student1.id, course_id: course2.id, grade: 'A')
    Enrollment.create!(student_id: student1.id, course_id: course3.id, grade: 'A')
    Enrollment.create!(student_id: student2.id, course_id: course1.id, grade: 'B')
    Enrollment.create!(student_id: student2.id, course_id: course2.id, grade: 'B')
    Enrollment.create!(student_id: student2.id, course_id: course3.id, grade: 'B')
    Enrollment.create!(student_id: student3.id, course_id: course1.id, grade: 'C')
    Enrollment.create!(student_id: student3.id, course_id: course2.id, grade: 'C')
    Enrollment.create!(student_id: student3.id, course_id: course3.id, grade: 'C')

    visit courses_path

    expect(page).to have_content(course1.name)
    expect(student1.name).to appear_before(student2.name)
    expect(student2.name).to appear_before(student3.name)
  end
end
