class AddPostCountToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :posts_count, :integer
  end
end
