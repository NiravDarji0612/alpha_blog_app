class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'example.com'
    mail(to: @user.email, subject: 'Welcome to Alpha-blog')
  end
end
