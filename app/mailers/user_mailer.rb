class UserMailer < ApplicationMailer
  def greetings_email(user, current_user)
    @user = user
    @current_user = current_user

    mail(to: @user.email, subject: 'New message')
  end
end
