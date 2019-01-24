module Api
  module V1
    class ParticipantsController < ApplicationController

  before_action :apipie_validations

  #before a action find a id
  before_action :set_participant, only: [:show, :update, :destroy]
  
  resource_description do
    short 'Documentation APIpie for model participants'
    description 'Model of participants who got a account on cityhack'
    formats ['json']
    # param :id, Fixnum, :desc => "Participant ID", :required => true
    error 404, "Missing"
    error 500, "Server crashed"
    error :unprocessable_entity, "Could not save the entity."
    returns :code => 403 do
       property :reason, String, :desc => "Why this was forbidden"
    end
    deprecated false
  end

  def_param_group :participant do
    param :id, Integer, :desc => "Participant ID"
    param :name, String, :desc => "Name of participant"
    param :vegan, String, :desc => "Vegan"
    param :tshirt_size, String, :desc => "Size of T-Shirt of participant"
    param :motor_difficulties, String, :desc => "Motor Difficulties of participant"
    param :allergies, String, :desc => "Allergies of participant"
    param :phone, String, :desc => "Phone of participant"
    param :leader, String, :desc => "Leader of Team"
    param :team_id, Integer, :desc => "Belongs to Team"
    param :user_id, Integer, :desc => "User"
  end



  # GET /participants
  api :GET, '/api/v1/participants' , 'Get all participants'
  param_group :participant
  def index
    @participants = Participant.includes(:user).all
  end

  #GET /participant/id
  api :GET, 'api/v1/participants/:id', 'Get a single participant'
  param_group :participant
  def show
  end

  # POST /participants
  api :POST, 'api/v1/participants', 'Create a new participant'
  param_group :participant
  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      render json: {status: 'Sucess', message:'Saved participant', data:@participant},status: :ok
    else
      render json: {status: 'Error', message:'Participant not saved', data:@participant.errors},status: :unprocessable_entity
    end
  end

  #PUT /participants/id
  api :PUT, 'api/v1/participants/:id' , 'Update a participant'
  param_group :participant
  def update
    if @participant.update(participant_params)
      render json: {status: 'Sucess', message:'Updated participant', data:@participant},status: :ok
    else
      render json: {status: 'Error', message:'Participant not updated', data:@participant.errors},status: :unprocessable_entity
    end
  end

  #DELETE /participants/id
  api :DELETE, 'api/v1/participants/:id' , 'Delete a participant'
  param_group :participant
  def destroy
      @participant.destroy
      render json: {status: 'Sucess', message:'Deleted Participant', data:@participant},status: :ok
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
      :name,:vegan, :tshirt_size, :motor_difficulties,
      :allergies, :leader, :phone, :course, :team_id, :user_id
    )
  end
end
    end
end