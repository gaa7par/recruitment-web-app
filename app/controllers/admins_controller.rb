class AdminsController < ApplicationController
  def show
    authorize :admin
  end
end
