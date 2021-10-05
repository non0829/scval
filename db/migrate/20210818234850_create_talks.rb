class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.text :name
      t.string :content

      t.timestamps
    end
  end
end
