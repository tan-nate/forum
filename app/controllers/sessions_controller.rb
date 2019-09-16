class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:alert] = "check your username and password"
            redirect_to '/login'
        end
    end

    def delete
        session.delete :user_id
        redirect_to root_path
    end
end