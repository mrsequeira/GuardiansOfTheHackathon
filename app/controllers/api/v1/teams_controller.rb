module Api
  module V1
  	class TeamsController < ApplicationController
	  
	before_action :apipie_validations

  	before_action :set_team, only: [:show, :update, :destroy]
	
	  
	resource_description do
		short 'Documentation APIpie for model teams'
		description 'Model of teams who will join the event cityhack'
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

	def_param_group :team do
		param :id, Integer, :desc => "Participant ID"
		param :name, String, :desc => "Name of Team"
		param :project, String, :desc => "Project Name"
		param :description, String, :desc => "Description of project"
		param :photo, String, :desc => "Photo of Team"
	end
	# GET /teams/1
	api :GET, '/api/v1/teams' , 'Get all teams'
	param_group :team
	def show
		#render json: @team
	end
	  
	# GET /teams
	api :GET, '/api/v1/teams/:id' , 'Get team'
	param_group :team
	def index
	    @teams = Team.all

	    #render json: @teams
	end

	# POST /teams
	api :POST, '/api/v1/teams' , 'Create a Team'
	param_group :team
	def create
		@team = Team.new(team_params)

		if @team.save
			render json: @team, status: :created, location: @team
		else
			render json: @team.errors, status: :unprocessable_entity
		end
	end

	# PUT /teams/1
	api :PUT, '/api/v1/teams/:id' , 'Update a team'
	param_group :team
	def update
		if @team.update(team_params)
          render json: {status: 'Sucess', message:'Updated team', data:@team},status: :ok
	    else
	      render json: {status: 'Error', message:'Team not updated', data:@team.errors},status: :unprocessable_entity
	    end
	end

	# DELETE /teams/1
	api :DELETE, '/api/v1/teams/:id' , 'Delete a team'
	param_group :team
	def destroy
		@team.destroy
  		render json: {status: 'Sucess', message:'Deleted Team', data:@team},status: :ok
	end

private
# Use callbacks to share common setup or constraints between actions.
  	def set_team
    	@team = Team.find(params[:id])
  	end

	def team_params
      params.require(:team).permit(:name, :project, :description, :photo, :created_at, :updated_at)
    end
end
    end
end