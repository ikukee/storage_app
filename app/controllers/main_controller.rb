class MainController < ApplicationController
    def index
    end
    
    def login

    end
    def auth
        user = User.find_by(email: params[:email])
        respond_to do |format|
            if user.present?
                if user.authenticate(params[:key])
                    session[:user_email] = user.email
                    session[:user_id] = user.id
                    format.html{redirect_to "/directory_folder"}
                end
            end
        end
    end 
    def logout
        session[:user_email] = nil
        session[:user_id] = nil
        redirect_to "/"
    end

end
