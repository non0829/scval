class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.text :name
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end