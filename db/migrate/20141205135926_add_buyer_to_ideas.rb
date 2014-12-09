class AddBuyerToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :buyer, index: true
  end
end
