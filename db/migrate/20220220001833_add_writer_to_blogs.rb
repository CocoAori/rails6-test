class AddWriterToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :writer, :string
    add_column :blogs, :passwd, :string
  end
end
