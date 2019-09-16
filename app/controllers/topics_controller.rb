class TopicsController < ApplicationController
    def index
        @topics = Topic.all
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
