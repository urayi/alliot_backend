class AddRankToRequirements < ActiveRecord::Migration[6.0]
  def change
    add_column :requirements, :rank, :integer
  end
end