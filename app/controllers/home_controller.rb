class HomeController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end

  def destroy
    @user = User.find(params[:id])

    authorize @user
    if @user.destroy
      redirect_to root_path, notice: 'User successfully deleted!'
    else
      render :index
    end
  end

  def send_email
    user = User.find_by(id: params[:user_id])
    UserMailerService.new(user, current_user).run
  end
end
