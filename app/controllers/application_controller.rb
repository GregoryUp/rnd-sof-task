class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.json { head :forbidden }

            if user_signed_in?
                format.html { redirect_to root_path, alert: exception.message }
            else
                format.html { redirect_to new_user_session_path, alert: exception.message }
            end
        end
    end
end
