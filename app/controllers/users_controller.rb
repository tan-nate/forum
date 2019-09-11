class UsersController < ApplicationController
    before_action :require_login, only: [:clipboard]
    
    def new
    end

    def create
        if User.find_by(username: user_params[:username])
            flash[:alert] = "username is taken"
            redirect_to '/signup'
        end
        User.create(user_params, clipboard: Clipboard.create)
        redirect_to root_path
    end

    def clipboard
        user = User.find(params[:id])
        @clipboard = user.clipboard
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
