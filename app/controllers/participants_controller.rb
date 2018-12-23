class ParticipantsController < ApplicationController

  resource_description do
    short 'APIpie for model participants'
    description 'This api its build to project called Guardians of Hackton to subject called Engenharia Software oriented by Renato Panda'
    formats ['json']
    # param :id, Fixnum, :desc => "Participant ID", :required => true
    error 404, "Missing"
    error 500, "Server crashed for some <%= reason %>", :meta => {:anything => "you can think of"}
    error :unprocessable_entity, "Could not save the entity."
    returns :code => 403 do
       property :reason, String, :desc => "Why this was forbidden"
    end
    deprecated false
  end

  def_param_group :participant do
     param :id, Fixnum, :desc => "Participant ID", :required => true
     param :Name, String, "Participant name",:required => false
     param :Team_id, Integer, "Team ID",:required =>true
  end

  #before a action find a id
  before_action :set_participant, only: [:show, :update, :destroy]

  # GET /participants
  api :GET, '/participants' , 'Get all participants'
  param_group :participant
  def index
    @participants = Participant.all
  end

  #GET /participant/id
  api :GET, '/participants/:id', 'Get participant'
  param_group :participant
  def show
  end

  # POST /participants
  api :POST, '/participants', 'Create a new participant'
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
  api :PUT, '/participants/:id' , 'Update a new participant'
  param_group :participant
  def update
    if @participant.update(participant_params)
      render json: {status: 'Sucess', message:'Updated participant', data:@participant},status: :ok
    else
      render json: {status: 'Error', message:'Participant not updated', data:@participant.errors},status: :unprocessable_entity
    end
  end

  #DELETE /participants/id
  api :DELETE, '/participants/:id' , 'Delete a new participant'
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
    params.require(:participant).permit(:name, :team_id)
  end
end
