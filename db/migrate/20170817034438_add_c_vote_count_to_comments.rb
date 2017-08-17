class AddCVoteCountToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :c_votes_count, :integer
  end
end
