class Quote < ApplicationRecord
    has_many :supported_users, foreign_key: :supporter_id, class_name: 'Support'
    has_many :supportees, through: :supported_users
    has_many :supporting_users, foreign_key: :supportee_id, class_name: 'Support'
    has_many :supporters, through: :supporting_users

    has_many :opposed_users, foreign_key: :opposer_id, class_name: 'Oppose'
    has_many :opposees, through: :opposed_users
    has_many :opposing_users, foreign_key: :opposee_id, class_name: 'Oppose'
    has_many :opposers, through: :opposing_users

    belongs_to :user
    belongs_to :topic

    has_many :clipboards_quotes
    has_many :clipboards, through: :clipboards_quotes

    validates :text, length: {in: 200..1000}
end
