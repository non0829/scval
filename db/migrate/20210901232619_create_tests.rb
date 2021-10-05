class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title
      t.string :content
      t.string :image
      t.string :advice
      t.integer :group_code
      t.integer :group_id

      t.timestamps
    end
  end
end
