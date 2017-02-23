class HomeController < ApplicationController
  def index
    @users = User.all

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
end
