class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_activity, only: [:show, :edit, :update]
  
  def index
    @activities = Activity.order("created_at DESC")
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
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path
    else
      render :edit
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to root_path
  end

  private

  def activity_params
    params.require(:activity).permit(:image, :activity_content, :contact).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless current_user.id == 1
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
