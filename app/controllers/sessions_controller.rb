class SessionsController < ApplicationController
  before_action :report_links
  
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.user_type == "Teacher"
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
    redirect_to root_path
    session[:user_id] = nil
  end
end
