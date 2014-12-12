class AddIdeaToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :idea, index: true
  end
end
