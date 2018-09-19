class ChangeDatatypePictureOfBlogs < ActiveRecord::Migration[5.1]
  def change
    change_column :blogs, :picture, :string
  end
end
