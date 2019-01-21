module Api
  module V1
    class TeamThemesController < ApplicationController

      before_action :apipie_validations
      before_action :set_team_theme, only: [:show, :update, :destroy]

      resource_description do
        short 'Documentation APIpie for model team_themes'
        description 'Model of relationship between team_themes'
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
    
      def_param_group :team_theme do
        param :id, Integer, :desc => "Team_theme ID"
        param :team_id, Integer, :desc => "Team id"
        param :theme_id, Integer, :desc => "Theme id"
      end

      # GET /team_themes
      api :GET, '/api/v1/team_themes' , 'Get all team_themes'
      param_group :team_theme
      def index
        @team_themes = TeamTheme.all
      end

      # GET /team_themes/1
      api :GET, '/api/v1/team_themes/:id' , 'Get a single team_themes'
      param_group :team_theme
      def show
      end

      # POST /team_themes
      api :POST, '/api/v1/team_themes' , 'Create a new team_themes'
      param_group :team_theme
      def create
        @team_theme = TeamTheme.new(team_theme_params)

        if @team_theme.save
          render :show, status: :created, location: api_v1_team_theme_url(@team_theme)
        else
          render json: @team_theme.errors, status: :unprocessable_entity
        end
      end

      # PUT /team_themes/1
      api :PUT, '/api/v1/team_themes/:id' , 'Update a team_themes'
      param_group :team_theme
      def update
        if @team_theme.update(team_theme_params)
          render :show, status: :ok, location: api_v1_team_theme_url(@team_theme)
        else
          render json: @team_theme.errors, status: :unprocessable_entity
        end
      end

      # DELETE /team_themes/1
      api :DELETE, '/api/v1/team_themes/:id' , 'Delete a team_themes'
      param_group :team_theme
      def destroy
        @team_theme.destroy
        render json: {status: 'Sucess', message:'Deleted theme', data:@team_theme},status: :ok
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_team_theme
          @team_theme = TeamTheme.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def team_theme_params
          #params.fetch(:team_theme, {})
          params.require(:team_theme).permit(:team_id, :theme_id, :create_at, :updated_at)
        end
    end
  end
end