class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :student?, :access, :assignment_access, :report_links

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

    def student?
      current_user.user_type == "Student"
    end

    def access
      @user = User.find_by_id params[:id]
      unless current_user == @user
        redirect_to user_path(current_user)
      end
    end
    
    def assignment_access
      if !Assignment.exists?(params[:id])
        redirect_to user_path(current_user)
      else
        @assignment = Assignment.find(params[:id])
      
        if student? && current_user.id != @assignment.user_id
            redirect_to user_path(current_user)
        elsif !student? && @assignment.submit == "No"
          redirect_to user_path(current_user)
        end
      end
    end

    def report_links
      @reports = Assignment.where(submit:"Yes").order('updated_at DESC')
    end 
    
end
