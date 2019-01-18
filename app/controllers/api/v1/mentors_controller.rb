module Api
  module V1
    class MentorsController < ApplicationController

    before_action :apipie_validations

    resource_description do
      short 'Documentation APIpie for model mentors'
      description 'Model of mentors who got a account on cityhack'
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
  
    def_param_group :mentor do
      param :id, Integer, :desc => "Mentor ID"
      param :name_mentor, String, :desc => "Name of Mentor"
      param :vegan, String, :desc => "Vegan"
      param :tshirt_size, String, :desc => "Size of T-Shirt of mentor"
      param :mentor_difficulties, String, :desc => "Motor Difficulties of mmentor"
      param :mentor_allergies, String, :desc => "Allergies of mentor"
    end

    #before a action find a id
    before_action :set_mentor, only: [:show, :update, :destroy]

  # GET /mentors
  api :GET, '/api/v1/mentors' , 'Get all Mentors'
  param_group :mentor  
  def index
    @mentors = Mentor.all
    
    #render json: @mentors
    
  end

  #GET /mentor/id
  api :GET, '/api/v1/mentors/:id' , 'Get a single Mentor'
  param_group :mentor  
  def show
    #render json: @mentor
  end

  # POST /mentors
  api :POST, '/api/v1/mentors' , 'Create a new Mentor'
  param_group :mentor  
  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      #render json: {status: 'Sucess', message:'Saved mentor', data:@mentor},status: :ok
      render json: @mentor, status: :created, location: @mentor
    else
      render json: @mentor.errors, status: :unprocessable_entity
      #render json: {status: 'Error', message:'mentor not saved', data:@mentor.errors},status: :unprocessable_entity
    end
  end

  api :PUT, '/api/v1/mentors/:id' , 'Update a Mentor'
  param_group :mentor  
  def update
    if @mentor.update(mentor_params)
      render json: {status: 'SUCCESS', message:'Updated mentor', data:@mentor},status: :ok
    else
      render json: {status: 'ERROR', message:'mentor not updated', data:@mentor.errors},status: :unprocessable_entity
    end
  end

  api :DELETE, '/api/v1/mentors/:id' , 'Delete a Mentor'
  param_group :mentor  
  def destroy
    @mentor.destroy
    render json: {status: 'Sucess', message:'Deleted mentor', data:@mentor},status: :ok
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  def mentor_params
    params.require(:mentor).permit(:name_mentor, :vegan, :tshirt_size, :mentor_difficulties, :mentor_allergies, :theme_id, :user_id)
  end
end
end
end
