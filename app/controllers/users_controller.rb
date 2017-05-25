class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: 'Account created successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

 private
  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :avatar,
                                 :password,
                                 :password_confirmation,
                                 :profile)
  end

  def find_user
    @user = User.find params[:id]
  end
end
