class AssignmentsController < ApplicationController
  before_action :teacher_permissions, only: [:new, :create, :edit, :update, :destroy]
  before_action :student_permissions, except: [:index, :new, :create]  
  before_action :report_links

  def index
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @student = Student.find_by_id current_user.id
    @assignment = Assignment.new(assignment_params)
    @assignment.user_id = current_user.id
    if @assignment.save
      flash[:warning] = "Your report has been submitted."
      redirect_to student_path(@student)
    else
      flash[:error] = "Your report did not submit. Please try again."
      redirect_to new_assignment_path
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:error] = "Your changes have been saved."
      redirect_to assignment_path(@assignment)
    else 
      flash[:error] = "Please check all of your fields."
      redirect_to edit_assignment_path
    end
  end

  def destroy
  end


  private
  def assignment_params
    params.require(:assignment).permit(:title, :body, :category, :link)
  end
end