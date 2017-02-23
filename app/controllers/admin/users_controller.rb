module Admin
  class UsersController < ApplicationController
    NUMBER_OF_POINTS = "SELECT SUM(points) FROM users
      JOIN points_of_interests ON user_id = users.id
      WHERE gender = 'woman' AND age BETWEEN 20 AND 30
      AND type_of_points = 'health' AND name LIKE 'cosm%'".freeze

    before_action :user, only: [:edit, :update]
    before_action :authorize_admin

    def index
      @users = User.all
      @result = ActiveRecord::Base.connection.exec_query NUMBER_OF_POINTS
    end

    def new
      @user = User.new
      @user.points_of_interests.build
    end

    def edit; end

    def create
      @user = User.new(user_params.merge(password: 'secret', password_confirmation: 'secret'))

      if @user.save
        redirect_to admin_users_path, notice: 'User created successfully!'
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User updated successfully!'
      else
        render :edit
      end
    end

    private

    def user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :email,
        :gender,
        :age,
        points_of_interests_attributes: [
          :id,
          :name,
          :type_of_points,
          :points
        ]
      )
    end

    def authorize_admin
      authorize :admin
    end
  end
end
