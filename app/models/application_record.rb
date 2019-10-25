class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    def namify(topic_name)
        if topic_name
            name_arr = topic_name.split.collect! do |word| 
                if word.downcase == word
                    word.capitalize
                else
                    word
                end
            end
            new_name = name_arr.join
        else
            new_name = nil
        end
        new_name
    end

    scope :most_recent, -> { order(created_at: :desc) }
end
