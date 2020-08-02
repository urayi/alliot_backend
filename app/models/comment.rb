class Comment < ApplicationRecord
  validates :comment, :presence => true
  validates :requeriment, :presence => true
  belongs_to :user, foreign_key: "user_id"
  belongs_to :requeriment, foreign_key: "requeriment_id"
end
