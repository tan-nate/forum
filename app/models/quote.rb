class Quote < ApplicationRecord
    # t.string :text
    # t.integer :fact_rating
    # t.integer :relevant_rating
    # t.integer :user_id
    # add_column :quotes, :source_url, :string

    has_many :supported_users, foreign_key: :supporter_id, class_name: 'Support'
    has_many :supportees, through: :supported_users
    has_many :supporting_users, foreign_key: :supportee_id, class_name: 'Support'
    has_many :supporters, through: :supporting_users

    has_many :opposed_users, foreign_key: :opposer_id, class_name: 'Oppose'
    has_many :opposees, through: :opposed_users
    has_many :opposing_users, foreign_key: :opposee_id, class_name: 'Oppose'
    has_many :opposers, through: :opposing_users

    belongs_to :user
    has_many :quote_topics
    has_many :topics, through: :quote_topics
end
