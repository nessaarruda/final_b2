require 'rails_helper'

describe 'As a visitor when I visit a student show page' do
  it 'I see the student name, courses they are enrolled and grades for each course' do
    student = Student.create!(name: 'Hermione Granger')
    course1 = Course.create!(name: 'Potions')
    course2 = Course.create!(name: 'Defense Agains the Dark Arts')
    course3 = Course.create!(name: 'Herbology')
    student_course_1 = Enrollment.create!(student_id: student.id, course_id: course1.id, grade: 'A')
    student_course_2 =Enrollment.create!(student_id: student.id, course_id: course2.id, grade: 'B')
    student_course_3 =Enrollment.create!(student_id: student.id, course_id: course3.id, grade: 'C')

    visit student_path(student)

    expect(page).to have_content(student.name)

    expect(page).to have_content("Course: #{course1.name}")
    expect(page).to have_content("Grade: #{student_course_1.grade}")


    expect(page).to have_content("Course: #{course2.name}")
    expect(page).to have_content("Grade: #{student_course_2.grade}")


    expect(page).to have_content("Course: #{course3.name}")
    expect(page).to have_content("Grade: #{student_course_3.grade}")
  end
end
