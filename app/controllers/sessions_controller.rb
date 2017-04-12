class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if (user)
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to posts_path , notice: 'Signed in!'
      else
        flash.now[:alert] ='Please check your email or password'
        render :new
      end
    else
      flash.now[:alert] ='Please check your email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path , notice: 'Signed out!'
  end
end
