class UsersController < ApplicationController
    before_action :require_login, only: [:clipboard]
    
    def new
    end

    def create
        if User.find_by(username: user_params[:username])
            flash[:alert] = "username is taken"
            redirect_to '/signup'
        else
            user = User.create(user_params)
            user.update(clipboard: Clipboard.create)
            redirect_to root_path
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
