class RelationshipsController < ApplicationController
  def create
  	follow = Relationship.new(following_id: current_user.id, follower_id: params[:user_id])
    follow.save
    redirect_to users_path
  end

  def destroy
  	follow = Relationship.find_by(following_id: current_user.id, follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end

  private
  def relationship_params
  	params.require(:relationship).permit(:following_id, :follower_id)
  end
end
