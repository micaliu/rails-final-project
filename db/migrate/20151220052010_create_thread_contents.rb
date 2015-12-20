class CreateThreadContents < ActiveRecord::Migration
  def change
    create_table :thread_contents do |t|
      t.text :content
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
