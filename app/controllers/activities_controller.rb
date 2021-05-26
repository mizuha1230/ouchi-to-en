class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :redirect_root, only: [:new, :create]
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:image, :activity_content, :contact).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless current_user.id == 1
  end
end
