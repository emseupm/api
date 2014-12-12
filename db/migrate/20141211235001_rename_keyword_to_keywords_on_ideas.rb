class RenameKeywordToKeywordsOnIdeas < ActiveRecord::Migration
  def change
    rename_column :ideas, :keyword, :keywords
  end
end
