class CreateCVotes < ActiveRecord::Migration
  def change
    create_table :c_votes do |t|
      t.integer :up
      t.integer :user_id
      t.integer :comment_id

      t.timestamps

    end
  end
end
