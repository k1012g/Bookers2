class SearchController < ApplicationController
	def search
		@users = User.all
		@books = Book.all
		@model = params[:model]
		@input = params[:input]
		@sort = params[:sort]
		@searches = searching(@model, @input, @sort)
	end

	private
	def searching(model, input, sort)
		if model == 'user'
			if sort == 'all'
				User.where(name: input)
			elsif sort == 'front'
				User.where('name LIKE ?', input+'%')
			elsif sort == 'back'
				User.where('name LIKE ?', '%'+input)
			else
				User.where('name LIKE ?', '%'+input+'%')
			end
		elsif model == 'book'
			if sort == 'all'
				Book.where(title: input)
			elsif sort == 'front'
				Book.where('title LIKE ?', input+'%')
			elsif sort == 'back'
				Book.where('title LIKE ?', '%'+input)
			else
				Book.where('title LIKE ?', '%'+input+'%')
			end
		end
	end
end
