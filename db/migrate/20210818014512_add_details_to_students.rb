class AddDetailsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :name, :text
    add_column :students, :team, :integer
    add_column :students, :group_code, :integer
    add_column :students, :point, :integer
  end
end
