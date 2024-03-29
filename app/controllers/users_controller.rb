class UsersController < ApplicationController
	before_action :correct_user, only: [:edit]

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      @users = User.all
      @book = Book.new
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  	@user = current_user
  	@users = User.all
  	@book = Book.new
  end

  def following
    @user = User.find(params[:user_id])
    @following = @user.followings
  end

  def follower
    @user = User.find(params[:user_id])
    @follower = @user.followers
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :postal_code, :prefecture, :city, :street)
  end

  def correct_user
  	@user = User.find(params[:id])
  	if current_user.id != @user.id
  		redirect_to user_path(current_user)
  	end
  end
end
