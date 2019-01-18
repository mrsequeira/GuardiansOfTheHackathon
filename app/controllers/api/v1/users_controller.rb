module Api
  module V1
    class UsersController < ApplicationController

    before_action :apipie_validations

    resource_description do
      short 'Documentation APIpie for model mentors'
      description 'Model of users, people who registered on website cityhack'
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
  
    def_param_group :users do
      param :id, Integer, :desc => "User ID"
      param :email, String, :desc => "Email of user"
      param :password_digest, String, :desc => "Password to Login"
      param :photo, String, :desc => "Photo of User"
      param :email_confirmed, String, :desc => "Confirm email to register"
      param :confirm_token, String, :desc => "Token confirmation"
      param :reset_password_token, String, :desc => "Token to reset password"
      param :reset_password_sent_at, String, :desc => "Date of passsword reset"
    end

      skip_before_action :authenticate_request  #APENAS PARA TESTES!!!!
      before_action :set_user, only: [:show, :create, :update, :destroy]

      # GET /users

      api :GET, '/api/v1/users' , 'Get all users'
      param_group :users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      api :GET, '/api/v1/users/:id' , 'Get a single user'
      param_group :users
      def show
        render json: @user
      end
      
      # POST /users
      # Endpoint replaced: /authenticate 
      # def create  
      #   @user = User.new(user_params)
      #   puts @user
      #   if @user.save
      #     render json: @user, status: :created, location: @user
      #   else
      #     render json: @user.errors, status: :unprocessable_entity
      #   end
      # end

      # PATCH/PUT /users/1
      api :PUT, '/api/v1/users/:id' , 'Update a user'
      param_group :users
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      api :DELETE, '/api/v1/users/:id' , 'Delete a user'
      param_group :users
      def destroy
        if @user.destroy
          @users = User.all
          render json: @users
        else
          render json: @user.errors, status: :unprocessable_entity
        end
  
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.permit(:user_id,:email, :password)
        end
    end
  end
end