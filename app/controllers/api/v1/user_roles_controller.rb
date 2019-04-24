module Api
  module V1
    class UserRolesController < ApplicationController

      before_action :apipie_validations

      skip_before_action :authenticate_request  #APENAS PARA TESTES!!!!
      before_action :set_user_role, only: [:show, :update, :destroy]

      resource_description do
        short 'Documentation APIpie for model user_roles'
        description 'This api its build to project called Guardians of Hackton to subject called Engenharia Software oriented by Renato Panda'
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
    
      def_param_group :user_role do
        param :id, Integer, :desc => "user_roles ID"
        param :role_id, Integer, :desc => "Role id PK and FK"
        param :user_id, Integer, :desc => "User id PF and Fk"
      end
    

      # GET /user_roles
      api :GET, '/api/v1/user_roles' , 'Get all user_Roles'
      param_group :user_role
      def index
        @user_roles = UserRole.all

        render json: @user_roles
      end

      # GET /user_roles/1
      api :GET, '/api/v1/user_roles/:id' , 'Get a single user_Roles'
      param_group :user_role
      def show
        render json: @user_role
      end

      # POST /user_roles
      api :POST, '/api/v1/user_roles' , 'Create a new user_roles'
      param_group :user_role
      def create
        @user_role = UserRole.new(user_role_params)

        if @user_role.save
          render json: @user_role, status: :created, location: api_v1_user_role_url(@user_role)
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_roles/1
      api :PUT, '/api/v1/user_roles/:id' , 'Update a user_Roles'
      param_group :user_role
      def update
        if @user_role.update(user_role_params)
          render json: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user_roles/1
      api :DELETE, '/api/v1/user_roles/:id' , 'Delete a user_Roles'
      param_group :user_role
      def destroy
        @user_role.destroy

        @user_roles = UserRole.all
        render json: @user_roles
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user_role
          @user_role = UserRole.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def user_role_params
          params.require(:user_role).permit(:user_id,:role_id)
        end
    end
  end
end
