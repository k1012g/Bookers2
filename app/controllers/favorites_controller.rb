class FavoritesController < ApplicationController
	def create
		current_user.favorites.create(book_id: params[:book_id])
		@book_show = Book.find(params[:book_id])
	end

	def destroy
		current_user.favorites.find_by(book_id: params[:book_id]).destroy
		@book_show = Book.find(params[:book_id])
	end
end
