module Api
  module V1
    class RolesController < ApplicationController
      skip_before_action :authenticate_request  #APENAS PARA TESTES!!!!
      before_action :apipie_validations
      before_action :set_role, only: [:show, :update, :destroy]

      resource_description do
        short 'Documentation APIpie for model Roles'
        description 'Model of roles to each user'
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
    
      def_param_group :role do
        param :id, Integer, :desc => "Role ID"
        param :name, String, :desc => "Name of participant"
      end

      # GET /roles
      api :GET, '/api/v1/roles' , 'Get all Roles'
      param_group :role
      def index
        @roles = Role.all
      end

      # GET /roles/1
      api :GET, '/api/v1/roles/:id' , 'Get a single Role'
      param_group :role
      def show
      end

      # POST /roles
      api :POST, '/api/v1/roles' , 'Create a new Role'
      param_group :role
      def create
        @role = Role.new(role_params)

        if @role.save
          render json: {status: 'Sucess', message:'Saved role', data:api_v1_team_theme_url(@role)},status: :ok
        else
          render json: {status: 'Error', message:'Role not saved', data:@role.errors},status: :unprocessable_entity
        end
      end

      # PATCH/PUT /roles/1
      api :PUT, '/api/v1/roles/:id' , 'Update a Role'
      param_group :role
      def update
        if @role.update(role_params)
          render json: {status: 'Sucess', message:'Updated role', data:api_v1_team_theme_url(@role)},status: :ok
        else
          render json:{status: 'Error', message:'Role not updated', data:@role.errors},status: :unprocessable_entity
        end
      end

      # DELETE /roles/1
      api :DELETE, '/api/v1/roles/:id' , 'Delete a Role'
      param_group :role
      def destroy
        @role.destroy
        render json:{status: 'Sucess', message:'Deleted Role', data:@role},status: :ok

      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_role
          @role = Role.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def role_params
          params.require(:role).permit(:name)
        end
    end
  end
end
