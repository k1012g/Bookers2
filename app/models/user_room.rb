class UserRoom < ApplicationRecord
	belongs_to :user
	belongs_to :room
end

# room id 1
# user_room user_id current_user.id room_id 1
# user_room user_id current_user.id room_id 2
# user_room user_id 2 room_id 1
