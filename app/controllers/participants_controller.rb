class ParticipantsController < ApplicationController

  #before a action find a id
  before_action :set_participant, only: [:show, :update, :destroy]

  # GET /participants
  def index
    @participants = Participant.all
    
    #sem nada bomba, com o render fica todo fudido
    render json: @participants
    
  end

  #GET /participant/id
  def show
    render json: @participant
  end

  # POST /participants
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      #render json: {status: 'Sucess', message:'Saved participant', data:@participant},status: :ok
      render json: @participant, status: :created, location: @participant
    else
      render json: @participant.errors, status: :unprocessable_entity
      #render json: {status: 'Error', message:'Participant not saved', data:@participant.errors},status: :unprocessable_entity
    end
  end

  def update
    if @participant.update(participant_params)
      render json: {status: 'SUCCESS', message:'Updated participant', data:@participant},status: :ok
    else
      render json: {status: 'ERROR', message:'Participant not updated', data:@participant.errors},status: :unprocessable_entity
    end
  end


  def destroy
      @participant.destroy
      render json: {status: 'Sucess', message:'Deleted Participant', data:@participant},status: :ok
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:id, :name, :team_id)
  end
end
