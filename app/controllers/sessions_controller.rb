class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
    end
end