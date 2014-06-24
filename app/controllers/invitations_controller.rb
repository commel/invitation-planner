class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  def index
    set_event
    @guest_count = @event.invitations.pluck(:qty).sum
  end

  # GET /invitations/1
  def show
    set_event    
  end

  # GET /invitations/new
  def new
    set_event
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
    set_event    
  end

  # POST /invitations
  def create
    set_event    
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
    set_event    
    if @invitation.update(invitation_params)
      redirect_to event_invitations_path(@event), notice: 'Invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitations/1
  def destroy
    set_event    
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
      params.require(:invitation).permit(:name, :qty, :guest_state_id)
    end
end
