class TopicsController < ApplicationController
    def index
        if params[:filter].blank? || params[:filter] == "following"
            if logged_in? && !current_user.topics.empty?
                @topics = current_user.topics.most_recent
            else
                @topics = Topic.all.most_recent
            end
        elsif params[:filter] == "all"
            @topics = Topic.all.most_recent
        else
            place = Place.find_by(name: params[:filter])
            @topics = place.topics.most_recent
        end
    end

    def show
        @topic = Topic.find(params[:id])
        @quotes = @topic.quotes.most_recent.order_by_rating
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
