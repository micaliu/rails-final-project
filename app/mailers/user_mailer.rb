class UserMailer < ApplicationMailer
  default from: 'registration@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'thank you for your registration')
  end
end
