class MentorsController < ApplicationController
    #before a action find a id
  before_action :set_mentor, only: [:show, :update, :destroy]

  # GET /mentors
  def index
    @mentors = Mentor.all
    
    #render json: @mentors
    
  end

  #GET /mentor/id
  def show
    #render json: @mentor
  end

  # POST /mentors
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

  def update
    if @mentor.update(mentor_params)
      render json: {status: 'SUCCESS', message:'Updated mentor', data:@mentor},status: :ok
    else
      render json: {status: 'ERROR', message:'mentor not updated', data:@mentor.errors},status: :unprocessable_entity
    end
  end


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
