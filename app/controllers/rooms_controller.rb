class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :redirect_room, only: [:new, :create]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_index_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end


  private

  def room_params
    params.require(:room).permit(:room_name, user_ids: [])
  end

  def redirect_room
    redirect_to rooms_index_path unless current_user.id == 1
  end
end
