class MessagesController < ApplicationController
  before_action :set_message, only: [:index, :create]
  def index
    @message = Message.new
    @messages = @room.messages.includes(:user)
    @my_messages = current_user.messages
    @message_partners = User.where.not(id: current_user.id)
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:image, :content, :heat_id, :condition_id).merge(user_id: current_user.id)
  end

  def set_message
    @room = Room.find(params[:room_id])
  end

end
