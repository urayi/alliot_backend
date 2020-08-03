class AddIndexesUniqueToVotes < ActiveRecord::Migration[6.0]
  def change
    add_index :votes, [:user, :requirement]
  end
end
