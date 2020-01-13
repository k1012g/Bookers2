document.addEventListener 'turbolinks:load', ->
  room_id = $('#messages').data('room_id')
  user_id = $('#messages').data('user_id')
  user_name = $('#messages').data('user_name')
  App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room_id: room_id, user_id: user_id },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log($('#messages').data('user_name'))
    $('#messages').append('<strong>' + user_name + '</strong> : ' + data['message'] + '<br>')

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
	if event.keyCode is 13
	  App.chat.speak(event.target.value)
	  event.target.value = ''
	  event.preventDefault()
