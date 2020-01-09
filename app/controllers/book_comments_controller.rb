class BookCommentsController < ApplicationController
	# before_action :correct_user, only: [:destroy]
	def create
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = params[:book_id]
		comment.save
		redirect_to book_path(params[:book_id])
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find_by(book_id: book.id)
		comment.destroy
		redirect_to book_path(params[:book_id])
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end

	# def correct_user
	# 	byebug
	# 	book = Book.find(params[:book_id])
	# 	comment = book.book_comments
	# 	if current_user.id != comment.user_id
	# 		redirect_to user_path(current_user.id)
	# 	end
	# end
end
