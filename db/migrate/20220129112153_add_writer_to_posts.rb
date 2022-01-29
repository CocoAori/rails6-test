class AddWriterToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :writer, :string
    add_column :posts, :user_created, :datetime
  end
end
