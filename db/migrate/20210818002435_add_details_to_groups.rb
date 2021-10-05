class AddDetailsToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :name, :text
    add_column :groups, :code, :integer
  end
end
