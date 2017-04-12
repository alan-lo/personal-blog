class PasswordResetsController < ApplicationController

  def new
    @user = User.new
  end

  def show
    # render json: params
     @user = User.find_by(reset_digest: params[:id])

  end

  def create
  # render json: params
      @user = User.find_by_email(params[:user][:email])
      if(@user)
          @user.create_reset_digest
          redirect_to password_reset_path(@user.reset_digest, email: @user.email)
      else
        flash[:error] = 'Please enter a valid email address'
        redirect_to new_password_reset_path
      end
  end

  def edit
    @user = User.find_by(reset_digest: params[:id])
  end


  def update
    @user = User.find_by(reset_digest: params[:id])
    if params[:user][:newpassword] == params[:user][:confirm]
      if (@user.update({password: params[:user][:newpassword]}))
        redirect_to new_session_path
      else
        render :edit
      end
    else
        flash[:error] = 'Password Mismatch'
        render :edit
    end
  end
end
