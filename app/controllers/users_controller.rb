class UsersController < ApplicationController
  def new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @title = "Sign up"
  end
end