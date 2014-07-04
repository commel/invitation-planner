#encoding: utf-8
class CostsController < ApplicationController
  before_action :set_event
  
  def index
    @costs = @event.costs
  end

  def create
    @cost = Cost.new(cost_params)
    @cost.event = @event

    if @cost.save
      redirect_to event_costs_path(@event), notice: 'Kosten wurden gespeichert.'
    else
      render :new
    end    
  end

  def edit
    @cost = @event.costs.find(params[:id])
  end

  def new
    @cost = Cost.new
  end

  def show
  end

  def update
  end

  def destroy
    @cost = @event.costs.find(params[:id])
    @cost.destroy
    redirect_to event_costs_path(@event), notice: 'Kosten wurden gelöscht.'
  end
  
  private
  
	# Use callbacks to share common setup or constraints between actions.
	def set_event
    @event = Event.find(params[:event_id])
	end

  # Only allow a trusted parameter "white list" through.
	def event_params
    params.require(:event).permit(:name, :eventdate)
	end
  
  def cost_params
    params.require(:cost).permit(:description, :amount)
  end
end
