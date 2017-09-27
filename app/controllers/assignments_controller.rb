class AssignmentsController < ApplicationController
  def index
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
  end

  def update
  end

  def destroy
  end

  private
  def assignment_params
    params.require(:assignment).permit(:title, :body, :category, :link)
  end
end