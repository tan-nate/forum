class QuotesController < ApplicationController
    def show
        @quote = Quote.find(params[:id])
    end
    def index
        if params[:topic_id]
            @quotes = Topic.find(params[:topic_id]).quotes
        else
            @quotes = Quote.all
        end
    end
end
