class UsersController < ApplicationController
    before_action :require_login, only: [:clipboard]
    
    def new
        @user = User.new
    end

    def create
        if User.find_by(username: user_params[:username])
            flash[:alert] = "username is taken"
            redirect_to '/signup'
        else
            @user = User.new(user_params)
            if @user.save
                @user.update(clipboard: Clipboard.create)
                session[:user_id] = @user.id
                redirect_to root_path
            end
        end
    end

    def clipboard
        user = User.find(params[:id])
        @clipboard = user.clipboard
    end

    def clear_clipboard
        user = User.find(params[:id])
        @clipboard = user.clipboard
        @clipboard.quotes.clear
        redirect_to clipboard_path(user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
