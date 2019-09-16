class Topic < ApplicationRecord
    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place

    def first_3_quotes
        self.quotes.limit(3).to_a
    end

    def namify
        name_arr = name.split.collect! {|word| word.capitalize}
        new_name = name_arr.join
    end
end
