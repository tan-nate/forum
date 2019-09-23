class SessionsController < ApplicationController
    def new
    end
    
    def create
        if auth
            @user = User.find_or_create_by(uid: auth['uid'])
            @user.username = namify(auth[:info][:name])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.find_by(username: params[:user][:username])
            if @user
                session[:user_id] = @user.id
                redirect_to root_path
            else
                flash[:alert] = "check your username and password"
                redirect_to '/login'
            end
        end
    end

    def delete
        session.delete :user_id
        redirect_to root_path
    end

    private
 
    def auth
        request.env['omniauth.auth']
    end
end