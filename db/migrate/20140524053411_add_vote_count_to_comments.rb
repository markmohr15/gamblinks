class AddVoteCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_votes_count, :integer
  end
end
