class BooksController < ApplicationController
	before_action :correct_book, only: [:edit]

	def show
		@book = Book.new
		@book_show = Book.find(params[:id])
		@user = @book_show.user
		@book_comment = BookComment.new
	end

	def edit
		@book = Book.new
		@book_edit = Book.find(params[:id])
	end

	def destroy
		@book_show = Book.find(params[:id])
		@book_show.destroy
		redirect_to books_path
	end

	def update
		@book_edit = Book.find(params[:id])
		if 	@book_edit.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path
		else
			render :edit
		end
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_book
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end
end
