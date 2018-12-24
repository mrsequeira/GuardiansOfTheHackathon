module Api
  module V1
    class AuthenticationController < ApplicationController

      skip_before_action :authenticate_request #actions aren't supposed to be authenticated
      def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
          render json: { auth_token: command.result }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
      end

    end
  end
end