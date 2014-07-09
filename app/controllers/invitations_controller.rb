class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  # GET /invitations
  def index
    @guest_count = @event.invitations.pluck(:qty).sum
  end

  # GET /invitations/1
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.event = @event
    
    if @invitation.save
      redirect_to event_invitations_path(@event), notice: 'Invitation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invitations/1
  def update
    @invitation.assign_attributes(invitation_params)
    if @invitation.save
      redirect_to event_invitations_path(@event), notice: 'Invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    redirect_to invitations_url, notice: 'Invitation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end  

    # Only allow a trusted parameter "white list" through.
    def invitation_params
      params.require(:invitation).permit(:name, :qty, :guest_state_id, :paying)
    end
end
