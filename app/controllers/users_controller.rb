class UsersController < ApplicationController
    def new
    end

    def create
        if User.find_by(username: user_params[:username])
            flash[:alert] = "username is taken"
            redirect_to '/signup'
        end
        User.create(user_params)
        redirect_to root_path
    end

    def clipboard
        user = User.find(params[:id])
        @clipboard = user.clipboard
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
