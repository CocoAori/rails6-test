class RemoveThumbupFromBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :thumbup, :integer
  end
end
