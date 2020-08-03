class Comment < ApplicationRecord
  validates :comment, :presence => true, on: :create
  validates :requeriment, :presence => true, on: :create
  belongs_to :user, foreign_key: "user_id"
  belongs_to :requeriment, foreign_key: "requeriment_id"
end
