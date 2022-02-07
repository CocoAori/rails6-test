class AddWriterToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :writer, :string
  end
end
