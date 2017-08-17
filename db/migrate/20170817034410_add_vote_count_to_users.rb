class AddVoteCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :votes_count, :integer
  end
end
