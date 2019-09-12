class QuotesController < ApplicationController
    before_action :require_login, only: [:new, :create, :add, :link, :post_link]
    
    def show
        @quote = Quote.find(params[:id])
        if current_user
            @clipboard = current_user.clipboard
        end
    end

    def new
        if params[:topic_id]
            @quote = Quote.new(topic_id: params[:topic_id])
        end
    end

    def create
        if params[:topic_id]
            @quote = current_user.quotes.create(quote_params)
        else
            topic = Topic.find_or_create_by(name: params[:topic_name], place_id: params[:topic_place_id])
            @quote = current_user.quotes.create(text: params[:text], source_url: params[:source_url])
            @quote.update(topic: topic)
        end
        redirect_to quote_path(@quote)
    end

    def add
        @quote = Quote.find(params[:id])
        current_user.clipboard.quotes << @quote
        redirect_to clipboard_path(current_user)
    end

    def link
        @quote = Quote.find(params[:id])
        @clipboard = current_user.clipboard
    end

    def post_link
        @quote = Quote.find(params[:id])
        new_quote = Quote.create(user: current_user, topic: @quote.topic, text: params[:text], source_url: params[:source_url])
        if params[:type] == "support"
            @quote.supporters << new_quote
        elsif params[:type] == "oppose"
            @quote.opposers << new_quote
        end
        redirect_to quote_path(@quote)
    end

    def post_link_clipboard
        @quote = Quote.find(params[:id])
        linked_quote = Quote.find(params[:linked_quote_id])
        if params[:type] == "support"
            @quote.supporters << linked_quote
        elsif params[:type] == "oppose"
            @quote.opposers << linked_quote
        end
        redirect_to quote_path(@quote)
    end

    # private

    def quote_params
        params.require(:quote).permit(:text, :source_url, :topic_id, topics_attributes: [:name, :place_id])
    end
end
