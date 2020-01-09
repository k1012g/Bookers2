class BookCommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]
	def create
		comment = current_user.book_comments.new(book_comment_params)
		comment.user_id = current_user.id
		comment.book_id = params[:book_id]
		comment.save
		redirect_to book_path(params[:book_id])
	end

	def destroy
		comment = BookComment.find(params[:id])
		comment.destroy
		redirect_to book_path(params[:book_id])
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
