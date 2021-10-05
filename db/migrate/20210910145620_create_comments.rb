class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :student, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
