class ActivitiesController < ApplicationController
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

  private
  def activity_params
    params.require(:activity).permit(:image, :activity_content, :contact).merge(user_id: current_user.id)
  end
end
