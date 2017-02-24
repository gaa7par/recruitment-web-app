class UserMailerService
  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end

  def run
    UserMailer.greetings_email(@user, @current_user).deliver_now
  end
end
