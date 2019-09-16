class ApplicationController < ActionController::Base
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def namify(topic_name)
        name_arr = topic_name.split.collect! {|word| word.capitalize}
        new_name = name_arr.join
    end

    private

    def require_login
        redirect_to forbidden_path unless session.include? :user_id
    end
end
