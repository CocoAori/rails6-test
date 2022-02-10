class AddChuToBlogs < ActiveRecord::Migration[6.0]
  def change
    #add_column :blogs, :thumbup, :integer 여기에 아래처럼 쓰면 디폴트 값 들어가는듯.
	add_column :blogs, :thumbup, :integer, default: 0
  end
end
