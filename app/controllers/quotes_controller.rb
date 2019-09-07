class QuotesController < ApplicationController
    def show
        @quote = Quote.find(params[:id])
    end
    def index
        @quotes = Quote.all
    end
    def new
        @quote = Quote.new(topic_id: params[:topic_id])
    end
    def create
        @quote = current_user.quotes.create(quote_params)
        redirect_to quote_path(@quote)
    end

    # private

    def quote_params
        params.require(:quote).permit(:text, :source_url, :topic_id)
    end
end
