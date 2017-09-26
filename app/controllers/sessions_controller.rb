class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.admin
          redirect_to teacher_path(@user)
      else
          redirect_to student_path(@user)
      end
    else 
      flash[:alert] = "Incorrect email or password."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
