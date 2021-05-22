class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    Activity.create(activity_params)
  end

  private
  def activity_params
    params.require(:activity).permit(:image, :activity_content, :contact).merge(user_id: current_user.id)
  end
end
