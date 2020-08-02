class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.references :requeriment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
