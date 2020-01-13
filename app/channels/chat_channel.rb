class ChatChannel < ApplicationCable::Channel
  def subscribed
  	# stream_from "some_channel"
    stream_from "chat_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Chat.create(user_id: params[:user_id], room_id: params[:room_id], message: data['message'])
  	ActionCable.server.broadcast "chat_channel_#{params['room_id']}", data
  end
end
