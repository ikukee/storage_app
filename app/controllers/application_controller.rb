class ApplicationController < ActionController::Base
    def is_logged_in
        if !session[:user_id].present?
            redirect_to "/"
        end
    end
end
