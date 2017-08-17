class AddSubscriptionCountToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :subscriptions_count, :integer
  end
end
