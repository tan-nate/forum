class SessionsController < ApplicationController
    def new
    end
    
    def create
        if auth
            @user = User.find_by(uid: auth['uid'])
            if !@user
                @user = User.create(uid: auth['uid'], username: namify(auth[:info][:name]), password: SecureRandom.hex(10), clipboard: Clipboard.create)
            end
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.find_by(username: params[:user][:username])
            if @user
                if @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id
                    redirect_to root_path
                else
                    flash[:alert] = "check your username and password"
                    redirect_to '/login'
                end
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