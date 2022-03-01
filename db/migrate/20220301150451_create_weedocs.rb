class CreateWeedocs < ActiveRecord::Migration[6.0]
  def change
    create_table :weedocs do |t|
      t.string :category
      t.string :organ
      t.string :sign1
      t.string :sign2
      t.string :strong
      t.string :cause
      t.string :expect

      t.timestamps
    end
  end
end
