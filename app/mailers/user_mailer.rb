# ref: https://edgeguides.rubyonrails.org/action_mailer_basics.html
class UserMailer < ApplicationMailer
    default from: 'hackathonnoreply@gmail.com'
 
    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "Registration Confirmation")
    end
end
