class TopicsController < ApplicationController
    def index
        if params[:filter].blank? || params[:filter] == "following"
            if logged_in? && !current_user.topics.empty?
                @topics = current_user.topics
            else
                @topics = Topic.all
            end
        else
            place = Place.find_by(name: params[:filter])
            @topics = place.topics
        end
    end

    def show
        @topic = Topic.find(params[:id])
    end

    def follow
        @topic = Topic.find(params[:id])
        current_user.topics << @topic
        redirect_to topic_path(@topic)
    end

    def unfollow
        @topic = Topic.find(params[:id])
        current_user.topics.delete(@topic)
        redirect_to topics_path
    end
end
