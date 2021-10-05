class AddStudentIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :answer, :string
    add_column :questions, :student_id, :integer
  end
end
