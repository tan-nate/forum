class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            return head(:forbidden)
        end
    end

    def delete
        session.delete :user_id
        redirect_to root_path
    end
end