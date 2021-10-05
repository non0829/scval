class ChangePointToStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :point, :integer
    add_column :students, :point, :integer, default: 0
  end
end
