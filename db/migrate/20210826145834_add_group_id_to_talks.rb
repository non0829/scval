class AddGroupIdToTalks < ActiveRecord::Migration[6.1]
  def change
    add_column :talks, :group_id, :integer
  end
end
