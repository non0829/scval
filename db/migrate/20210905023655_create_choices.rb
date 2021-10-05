class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.text :content
      t.boolean :is_answer
      t.integer :problem_id

      t.timestamps
    end
  end
end
