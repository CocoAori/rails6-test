class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :result

      t.timestamps
    end
  end
end
