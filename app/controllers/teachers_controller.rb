class TeachersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  before_action :user_access, only: [:show, :edit, :update, :destroy]  
  before_action :report_links
  
  
  def index
    @teachers = User.where(user_type:"Teacher")
    @students = User.where(user_type:"Student")
  end

  def show
    @teacher = Teacher.find(params[:id])  
    @students = User.where(user_type:"Student")
    @assignments = Assignment.where(submit:"Yes")
  end

  # def new
  #   @teacher = Teacher.new
  # end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.admin = true
    if @teacher.save
      session[:user_id] = @teacher.id
      flash[:warning] = "Account created."
      redirect_to teacher_path(@teacher)
    else
      flash[:error] = "Account was not created."
      redirect_to new_teacher_path
    end
  end

  def edit
    @teacher = Teacher.find_by_id current_user.id
  end

  def update
    @user = User.find_by_id current_user.id
    if @user.update(teacher_params)
      flash[:error] = "Your changes have been saved."
      redirect_to teacher_path(@user)
    else 
      flash[:error] = "Please check all of your fields."
      redirect_to edit_teacher_path
    end
  end

  def destroy
    @teacher = Teacher.find_by_id current_user.id
    session[:user_id] = nil
    if @teacher.destroy
      flash[:warning] = "Your account has been permanently deleted."
      redirect_to new_session_path
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end