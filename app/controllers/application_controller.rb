class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :student_access, :teacher_access
  
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorize
      unless logged_in?
        flash[:danger] = "You must be logged in to do that."
        redirect_to new_session_path unless logged_in?
      end
    end

    def user_access
      if current_user.user_type == "Student"
        @user = User.find(params[:id])
        unless session[:user_id] == @user.id
          flash[:warning] = "You do not have access to this page."
          redirect_to student_path(current_user)
        end
      elsif current_user.user_type == "Teacher"
        @user = User.find(params[:id])
        unless session[:user_id] == @user.id || @user.user_type == "Student"
          flash[:warning] = "You do not have access to this page."
          redirect_to teacher_path(current_user)
        end
      end
    end


    # def assignment_auth 
    #   @assignment = Assignment.find(params[:id])
    #   unless session[:user_id] == @assignment.user_id
    #     flash[:warning] = "You don't have access to this."
    #     if current_user.admin
    #       redirect_to teacher_path(current_user)
    #     else 
    #       redirect_to student_path(current_user)
    #     end
    #   end
    # end
end
