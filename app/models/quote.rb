class Quote < ApplicationRecord
    has_many :supported_quotes, foreign_key: :supporter_id, class_name: 'Support'
    has_many :supportees, through: :supported_quotes
    has_many :supporting_quotes, foreign_key: :supportee_id, class_name: 'Support'
    has_many :supporters, through: :supporting_quotes

    has_many :opposed_quotes, foreign_key: :opposer_id, class_name: 'Oppose'
    has_many :opposees, through: :opposed_quotes
    has_many :opposing_quotes, foreign_key: :opposee_id, class_name: 'Oppose'
    has_many :opposers, through: :opposing_quotes

    belongs_to :user
    belongs_to :topic

    has_many :clipboards_quotes
    has_many :clipboards, through: :clipboards_quotes

    validates :text, length: { in: 200..1000 }
    validates :source_url, format: { with: /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i, 
        message: "is not a valid url" }
    validates :topic_id, presence: true

    def support_count
        supporters.length
    end

    def oppose_count
        opposers.length
    end
end
