class ChangeVotesCountDefaultToZero < ActiveRecord::Migration
 def up
    change_column_default :links, :votes_count, 0
  end

  def down
    change_column_default :links, :votes_count, nil
  end
end
