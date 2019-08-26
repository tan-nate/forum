class CreateUserTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_topics do |t|
      t.integer :user_id
      t.integer :topic_id
    end
  end
end
