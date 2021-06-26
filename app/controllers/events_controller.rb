class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(params_event)
    if @event.save
      redirect_to events_path
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.js { render partial: 'error' }
      end
    end
  end

  def params_event
    params.require(:event).permit(:title, :start, :end_time).merge(user_id: current_user.id)
  end
end
