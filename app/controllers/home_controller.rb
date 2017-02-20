class HomeController < ApplicationController
  def index
    @users = User.all
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
