class AddStudentIdToTalks < ActiveRecord::Migration[6.1]
  def change
    add_column :talks, :student_id, :integer
  end
end
