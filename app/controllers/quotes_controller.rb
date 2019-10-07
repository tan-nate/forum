class QuotesController < ApplicationController
    before_action :require_login, only: [:new, :create, :add, :link, :post_link]
    
    def index
        redirect_to root_path
    end
    
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
        @quote = current_user.quotes.new(quote_params)
        @quote.topic = Topic.find_or_create_by(name: namify(params[:quote][:topic_name]), place_id: params[:quote][:topic_place])
        if @quote.save
            redirect_to quote_path(@quote)
        else
            @quote.topic.destroy if @quote.topic.quotes.empty?
            render :new
        end
    end

    def add
        @quote = Quote.find(params[:id])
        if !current_user.clipboard.quotes.include?(@quote)
            current_user.clipboard.quotes << @quote
        end
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
            if !@quote.supporters.include?(linked_quote) && linked_quote != @quote
                @quote.supporters << linked_quote
            end
        elsif params[:type] == "oppose"
            if !@quote.opposers.include?(linked_quote) && linked_quote != @quote
                @quote.opposers << linked_quote
            end
        end
        redirect_to quote_path(@quote)
    end

    def destroy
        @quote = Quote.find(params[:id])
        topic = @quote.topic
        if @quote.user == current_user && @quote.supporters.empty? && @quote.opposers.empty?
            @quote.destroy
            if topic.quotes.empty?
                topic.destroy
                redirect_to topics_path
            else
                redirect_to topic_path(topic)
            end
        else
            flash[:alert] = "sorry, but only a quote with no linked quotes can be deleted."
            redirect_to quote_path(@quote)
        end
    end

    def vote
    end

    private

    def quote_params
        params.require(:quote).permit(:text, :source_url)
    end
end
