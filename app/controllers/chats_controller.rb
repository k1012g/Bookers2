class ChatsController < ApplicationController
	def show
	  	@currentUserRoom = UserRoom.where(user_id: current_user.id)
	  	if @currentUserRoom.blank?
	  		@room = Room.create
	  		UserRoom.create(user_id: params[:id], room_id: @room.id)
	  		UserRoom.create(user_id: current_user.id, room_id: @room.id)
	  	else
	  		@SearchRoom = @currentUserRoom.pluck(:room_id)
	  		@ExistRoom = UserRoom.find_by(room_id: @SearchRoom, user_id: params[:id])
	  		if @ExistRoom.nil?
	  			@room = Room.create
	  			UserRoom.create(user_id: params[:id], room_id: @room.id)
	  			UserRoom.create(user_id: current_user.id, room_id: @room.id)
	  		else
	  			@room = Room.find_by(id: @ExistRoom.room_id)
	  		end
	  	end
	  	@user = User.find(params[:id])
	  	@chatall = Chat.where(room_id: @room.id)
  	end
end
