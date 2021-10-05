class AddRightAnswerToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :right_answer, :boolean
  end
end
