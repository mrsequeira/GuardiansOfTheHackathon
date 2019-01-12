module Api
  module V1
    class AuthenticationController < ApplicationController

      skip_before_action :authenticate_request #actions aren't supposed to be authenticated
      
      ########################
      ## Register
      ########################
      def authenticate
        puts "Received parameters:  #{user_params['password_confirmation']}" 
        
        ## Already exists?
        replicated = User.find_by_email(params[:email])
        puts "Replicated:  #{replicated}" 
        if replicated 
          render json: { error: "This email already exists" }, status: :unauthorized
        else 
          user = User.create!(user_params)
          # AQUI INSERIR CONFIRMAÇÃO DO EMAI  L +  adicionar na db parametro active as boolean
          render json: { sucess: "Successfully registered" }, status: :authorized 
        end
      end

      ########################
      ## Login(obtain jwt)
      ########################
      def login
        command = AuthenticateUser.call(params[:email], params[:password]) 
        if command.success?
          render json: { auth_token: command.result }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
      end 


      private

      # didn't use "ActionController::Parameters.permit_all_parameters = true" for security reasons 
      def user_params
        params.permit(
          :email,
          :password,
          :password_confirmation
        )
      end

    end
  end
end