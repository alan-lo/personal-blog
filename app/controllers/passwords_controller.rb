class PasswordsController < ApplicationController

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    #  test if the password is right
    if @user.authenticate(params[:user][:currentpassword])
      # check if the password is same as confirmation
      if (params[:user][:newpassword] == params[:user][:confirm])
        # check if the new password is different
        if (params[:user][:currentpassword] != params[:user][:newpassword])
          flash[:success] = "Your password is changed."
          if (@user.update({password: params[:user][:newpassword]}))
            puts "Password saved"
            puts @user
            redirect_to edit_user_path(@user)
          else
            puts "Password not saved"
            render :edit
          end
        else
          flash.now[:error] = "Please enter a different password"
          render :edit
        end
      else
        puts "Password Mismatch"
        flash.now[:error] = "Password Confirmation Mismatch"
        render :edit
      end
    else
        puts "Current password is wrong!"
        flash.now[:error] = "Current Password Mismatch"
        render :edit
    end
  end

  private
   def user_params
     params.require(:user).permit(:email,
                                  :password,
                                  :confirm)
   end
end
