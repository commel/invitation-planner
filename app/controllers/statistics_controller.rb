class StatisticsController < ApplicationController
  before_action :set_event, only: [:index]
  
  def index
    @statistics = @event.statistics
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
  
end
