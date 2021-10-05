class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.integer :test_id
      t.string :content
      t.string :image

      t.timestamps
    end
  end
end
