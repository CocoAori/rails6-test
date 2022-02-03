class AddWriterToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :writer, :string
    add_column :posts, :user_created, :datetime
  end
end
##기존 컬럼에 추가하고 싶을떄. 어떤 모델에, 컬럼이름, 자료형