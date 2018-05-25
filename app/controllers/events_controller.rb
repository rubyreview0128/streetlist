class EventsController < ApplicationController

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
   @events = Event.page(params[:page]).per(10)
  end

  def new
    @event = Event.new
  end

  def show
    @page_title = @event.name
  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to event_url(@event)
      flash[:notice] = "事件更新成功"
    else
      render :action => :edit
    end
  end

  def destroy

    @event.destroy

    redirect_to events_url
    flash[:alert] = "成功刪除事件"
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url
      flash[:notice] = "成功新增事件"
    else
      render :action => :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :price, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
