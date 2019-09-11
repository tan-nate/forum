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
        else
            @quote = Quote.new
        end
    end

    def create
        @quote = current_user.quotes.create(quote_params)
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

    # private

    def quote_params
        params.require(:quote).permit(:text, :source_url, :topic_id)
    end
end
