module Api
	class TeamsController < ApplicationController
	  
	  	before_action :set_team, only: [:show, :update, :destroy]
		before_action :set_theme, only: [:indexTeams]
		
		# GET /teams/1
		def show
			#render json: @team
		end
		  
		# GET /teams
		def index
		    @teams = Team.all

		    #render json: @teams
		end

		# GET /themes/1/teams
		def indexTeams
	    	@teams = @team.theme.all

	    	#render json: @teams
		end
	  
		# POST /teams
		def create
			@team = Team.new(team_params)

			if @team.save
				render json: @team, status: :created, location: @team
			else
				render json: @team.errors, status: :unprocessable_entity
			end
		end

		# PUT /teams/1
		def update
			if @team.update(team_params)
	          render json: {status: 'Sucess', message:'Updated team', data:@team},status: :ok
		    else
		      render json: {status: 'Error', message:'Team not updated', data:@team.errors},status: :unprocessable_entity
		    end
		end

		# DELETE /teams/1
		def destroy
			@team.destroy
      		render json: {status: 'Sucess', message:'Deleted Team', data:@team},status: :ok
		end

	private
	# Use callbacks to share common setup or constraints between actions.
	  	def set_team
	    	@team = Team.find(params[:id])
	  	end
	  	def set_theme
		 	@theme = Themes.find(params[:id])
		end

		def team_params
	      params.require(:team).permit(:name, :project, :description, :photo, :created_at, :updated_at)
	      
	    end
	end
end