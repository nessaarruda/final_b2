class AddGradeToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :grade, :string
  end
end
