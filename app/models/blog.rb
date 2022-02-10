class Blog < ApplicationRecord
	#, :dependent => :destroy 이거 넣으면 글 지워질때 댓글도 같이 지워지네. 이거 없으면 글 삭제 안되고 에러남.
	has_many :comments, :dependent => :destroy
end
