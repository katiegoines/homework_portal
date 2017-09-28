class UsersController < ApplicationController  
  before_action :report_links
  
  def index
    @assignments = Assignment.all
  end
  
  def new
    @user = User.new
  end

  def show
    redirect_to new_session_path
  end

  def create
    @user = User.new(user_params)
    if @user.code == "1234"
      @user.user_type = "Teacher"
      if @user.save
        session[:user_id] = @user.id
        flash[:warning] = "Account created."
        redirect_to teacher_path(@user)
      else
        if !!@user.email
          flash[:error] = "This email is already in use"
          redirect_to new_user_path
        elsif
          @user.password == '' || @user.password_confirmation == ''
          flash[:error] = "Plesae enter and confirm password."
          redirect_to new_user_path
        else
          flash[:error] = "Account was not created. Please complete all fields." 
          redirect_to new_user_path
        end
      end
    elsif @user.code == ''
      @user.user_type = "Student"
      if @user.save
        session[:user_id] = @user.id
        flash[:warning] = "Account created."
        redirect_to student_path(@user)
      else
        if !!@user.email
          flash[:error] = "This email is already in use"
          redirect_to new_user_path
        elsif
          @user.password == '' || @user.password_confirmation == ''
          flash[:error] = "Plesae enter and confirm password."
          redirect_to new_user_path
        else
          flash[:error] = "Account was not created. Please complete all fields." 
          redirect_to new_user_path
        end
      end
    else
      flash[:warning] = "Please check all fields."
      redirect_to new_user_path
    end 
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :current_password, :password, :password_confirmation, :code)
  end
end
