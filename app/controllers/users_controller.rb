class UsersController < ApplicationController  
  before_action :authorize, only: [:show, :edit, :update, :destroy]  
  before_action :report_links
  before_action :access, except: [:index]
  
  def index
  end



  def show
    @user = User.find(params[:id])
    if student?
      @assignment = Assignment.new
    else
      @students = User.where(user_type:"Student")
      @assignments = Assignment.where(submit:"Yes")
    end
  end


  
  def new
    @user = User.new
  end



  def create
    @user = User.new(user_params)
    if @user.code == "1234"
      @user.user_type = "Teacher"
      if @user.save
        session[:user_id] = @user.id
        flash[:warning] = "Account created."
        redirect_to user_path(@user)
      else
        if !!@user.email
          flash[:error] = "Please make sure this email is formatted correctly and isn't already in use."
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
        redirect_to user_path(@user)
      else
        if !!@user.email
          flash[:error] = "Please make sure this email is formatted correctly and isn't already in use."
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



  def edit
    @user = User.find_by_id current_user.id
  end



  def update
    @user = User.find_by_id current_user.id
    if @user.update(user_params)
      flash[:error] = "Your changes have been saved."
      redirect_to user_path(@user)
    else 
      flash[:error] = "Please check all of your fields."
      redirect_to edit_user_path
    end
  end


  def destroy
    @user = User.find_by_id current_user.id
    if @user.user_type == "Teacher"
      session[:user_id] = nil
      if @user.destroy
        flash[:warning] = "Your account has been permanently deleted."
        redirect_to new_session_path
      end
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :current_password, :password, :password_confirmation, :code)
  end
end
