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
    def new
        @quote = Quote.new(topic_id: params[:topic_id])
    end

    private

    def quote_params
        params.require(:quote).permit(:topic_id)
    end
end
