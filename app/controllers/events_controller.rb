class EventsController < ApplicationController
  def new
    @event = events.new
    render plain: render_to_string(partial: 'from_new', layout: false, locals: { event: @event })
  end
end
