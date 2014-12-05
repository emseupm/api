class RemoveOwnerFromIdeas < ActiveRecord::Migration
  def change
      remove_column :ideas, :owner
  end
end
