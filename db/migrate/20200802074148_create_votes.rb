class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.boolean :vote, null: false
      t.references :user, null: false, foreign_key: true
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
