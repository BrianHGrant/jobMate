class EventsController < ApplicationController
  before_action :authenticate_user!
  helper ApplicationHelper
  def index
    @events = current_user.events.order(date: :asc, time: :asc).page(params[:page]).per(10)
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = 'Event successfully added!'
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
    @update = params[:update]
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.user = current_user
    if @event.update(event_params)
      flash[:notice] = 'Edit Successful!'
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :time, :date, :duration, :description, :eventable_id)
  end
end
