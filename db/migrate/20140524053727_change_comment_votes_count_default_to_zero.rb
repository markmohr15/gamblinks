class ChangeCommentVotesCountDefaultToZero < ActiveRecord::Migration
  def up
    change_column_default :comments, :comment_votes_count, 0
  end

  def down
    change_column_default :comments, :comment_votes_count, nil
  end
end

