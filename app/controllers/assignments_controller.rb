class AssignmentsController < ApplicationController
  before_action :authorize
  before_action :assignment_access, except: [:index, :new, :create]  
  before_action :report_links
  

  def index
    @user = User.find_by_id current_user.id
    @submitted = @user.assignments.where(submit:"Yes").reverse
    @in_prog = @user.assignments.where(submit:"No").reverse.each
    @assignments = Assignment.where(submit:"Yes")
    @students = User.where(user_type:"Student")
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @user = User.find_by_id current_user.id
    @assignment = Assignment.new(assignment_params)
    @assignment.user_id = current_user.id
    if @assignment.save
      flash[:success] = "Your report has been submitted."
      redirect_to user_path(@user)
    else
      flash[:warning] = "Your report did not submit. Please try again."
      redirect_to new_assignment_path
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    if @assignment.submit == "Yes"
      redirect_to assignment_path(@assignment)
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:success] = "Your changes have been saved."
      redirect_to assignment_path(@assignment)
    else 
      flash[:warning] = "Your changes were not saved. Please check all of your fields."
      redirect_to edit_assignment_path
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment.destroy
      flash[:danger] = "Your report has been deleted."
      redirect_to user_path(current_user)
    end
  end


  private
  def assignment_params
    params.require(:assignment).permit(:title, :body, :category, :link, :submit, :assignment_number)
  end
end