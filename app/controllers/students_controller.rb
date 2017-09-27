class StudentsController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  before_action :user_access, only: [:show, :edit, :update, :destroy]


  def index
    @students = Student.all
  end

  def show
    # @student = Student.find(params[:id])
    @user = User.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.admin = false
    if @student.save
      session[:user_id] = @student.id
      flash[:warning] = "Account created."
      redirect_to student_path(@student)
    else
      flash[:error] = "Account was not created."
      redirect_to new_student_path
    end
  end

  def edit
    @student = Student.find_by_id current_user.id
    
  end

  def update
    @student = Student.find_by_id current_user.id
    if @student.update(student_params)
      flash[:warning] = "Your password has been changed."
      redirect_to student_path(@student)
    else
      flash[:warning] = "Your password has NOT been changed."
      redirect_to edit_student_path
    end
  end

  def destroy
  end

  private
  def student_params
    params.require(:student).permit(:name, :surname, :email, :password, :password_confirmation)
  end

end
