class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.string :url
      t.text :content
      t.integer :user_id
      t.string :comment
      t.integer :comments_count, :default => 0

      t.timestamps
    end
  end
end
