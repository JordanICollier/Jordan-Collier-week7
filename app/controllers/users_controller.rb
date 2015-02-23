class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @users = User.all

  end

  def new

  end

  def create
    if @user.save(user_params)
      redirect_to users_path, notice: "Yeah the user was created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Updated like a fresh new coat of paint."
    else
      render :new
    end
  end

  def show

  end


private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end
