class QuotesController < ApplicationController
    def show
        @quote = Quote.find(params[:id])
    end
    def index
        @quotes = Quote.all
    end
    def new
        @quote = Quote.new
        @topics = Topic.all
    end

    private

    def quote_params
    end
end
