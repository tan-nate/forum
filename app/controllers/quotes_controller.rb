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
            @topic = Topic.new
        else
            @quote = Quote.new
            @topic = Topic.new
        end
    end

    def create
        if params[:quote]
            if params[:quote][:topic_id]
                @quote = current_user.quotes.new(quote_params)
            end
        else
            topic = params[:topic_name]
            namified_topic = namify(topic)
            @topic = Topic.find_or_initialize_by(name: namified_topic, place_id: params[:topic_place_id])
            @quote = current_user.quotes.new(text: params[:text], source_url: params[:source_url])
        end
        if @topic
            if @topic.valid?
                @quote.topic = @topic
                if @quote.valid?
                    @topic.save
                    @quote.save
                    redirect_to quote_path(@quote)
                else
                    render :new
                end
            else
                if @quote.valid?
                    render :new
                else
                    render :new
                end
            end
        else
            if @quote.valid?
                @quote.save
                redirect_to quote_path(@quote)
            else
                render :new
            end
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
        params.require(:quote).permit(:text, :source_url, :topic_id)
    end
end
