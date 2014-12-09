class AddKeywordToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :keyword, :string
  end
end
