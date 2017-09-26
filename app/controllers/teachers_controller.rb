class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    @students = Student.all
  end

  def show
    @teacher = Teacher.find(params[:id])  
    @students = Student.all

  end

  def new
    @teacher = Teacher.new
  end

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
  end

  def update
  end

  def destroy
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :surname, :email, :password, :password_confirmation)
  end

end