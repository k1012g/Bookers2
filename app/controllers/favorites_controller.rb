class FavoritesController < ApplicationController
	def create
		# book = Book.find(params[:book_id])
		# byebugl
		# binding.pry
		favorite = current_user.favorites.create(book_id: params[:book_id])
		# favorite.save
		@book_show = Book.find(params[:book_id])
		# redirect_back(fallback_location: book_path(book.id))
	end

	def destroy
		# book = Book.find(params[:book_id])
		# binding.pry
		favorite = current_user.favorites.find_by(book_id: params[:book_id]).destroy
		# favorite.destroy
		@book_show = Book.find(params[:book_id])
		# redirect_back(fallback_location: book_path(book.id))
	end
end
