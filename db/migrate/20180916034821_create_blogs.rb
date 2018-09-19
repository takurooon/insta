class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :picture
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
