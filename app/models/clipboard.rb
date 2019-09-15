class Clipboard < ApplicationRecord
    belongs_to :user
    has_many :clipboard_quotes
    has_many :quotes, through: :clipboard_quotes

    def clipboard_topics
        topics = quotes.collect do |quote|
            quote.topic
        end
        topics.uniq!
        topics
    end

    def clipboard_topic_quotes(topic)
        quotes.select {|q| q.topic == topic}
    end
end
