class BookCommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]
	def create
		comment = BookComment.new(book_comment_params)
		comment.user_id = current_user.id
		comment.book_id = params[:book_id]
		comment.save
		@book_show = Book.find(params[:book_id])
		@book_comment= BookComment.new
	end

	def destroy
		BookComment.find(params[:id]).destroy
		@book_show = Book.find(params[:book_id])
		@book_comment = BookComment.new
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end

	def correct_user
		comment = BookComment.find(params[:id])
		if current_user.id != comment.user_id
			redirect_to user_path(current_user.id)
		end
	end
end
