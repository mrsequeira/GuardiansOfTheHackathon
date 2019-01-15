module Api
  module V1
    class AuthenticationController < ApplicationController

      skip_before_action :authenticate_request #actions aren't supposed to be authenticated
      
      ########################
      ## Register
      ## next version this will be transfered to user controller!!!
      ########################
      def authenticate
        puts "Received parameters:  #{user_params['email']}" 

        @user = User.new(user_params)    
        if @user.save
          @user.set_confirmation_token
          @user.save(validate: false)     
          begin
            UserMailer.registration_confirmation(@user).deliver_now  
          rescue  Exception => e
            logger.warn "email delivery error = #{e}"
          end
          render json: { sucess: "Successfully registered, confirm your email address!" }, status: :authorized 
        else
          render json: { error: "This email already exists" }, status: :unauthorized
        end
      end


      ########################
      ## Email confirmation
      ########################
      def confirm_email
        user = User.find_by_confirm_token(params[:token])
        if user
          user.validate_email
          render json: { sucess: "Your email has been confirmed!" }, status: :authorized 
        else
          render json: { sucess: "Get the fckout of here!" }, status: :unauthorized 
        end
      end

      ###########################
      ## REQUEST forgot password
      ###########################
      def forgot
        if params[:email].blank? # check if email is present
          render json: {error: "Email not present"}
        end
        
        @user = User.find_by(email: params[:email]) # if present find user by email
        p @user
        if @user.present?
          @user.generate_password_token! # generate pass token
          begin
            UserMailer.forgot_password(@user).deliver_now  
          rescue  Exception => e
            logger.warn "email delivery error = #{e}"
          end
          render json: {status: "We sended you a email to change the pasword!"}, status: :ok
        else
          render json: {error: ["Email address not found. Please check and try again."]}, status: :not_found
        end
      end


      ###########################
      ## RESET password
      ###########################
      def reset
        token = params[:token].to_s

        # if params[:email].blank?
        #   return render json: {error: "Token not present"}
        # end
        
        user = User.find_by(reset_password_token: token)
        
        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: {status: "Password has been changed successfully"}, status: :ok
          else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
          end
        else
          render json: {error: "Link not valid or expired. Try generating a new link." }, status: :not_found
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