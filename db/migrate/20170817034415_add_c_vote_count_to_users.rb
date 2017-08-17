class AddCVoteCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :c_votes_count, :integer
  end
end
