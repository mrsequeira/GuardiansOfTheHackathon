module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request  #APENAS PARA TESTES!!!!
      before_action :set_user, only: [:show, :create, :update, :destroy]

      # GET /users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
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
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
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