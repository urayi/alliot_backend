class Requeriment < ApplicationRecord
  validates :title, :presence => true
  validates :content, :presence => true
  belongs_to :user, foreign_key: "user_id"
  has_many :comments, foreign_key: "requeriment_id"
  has_many :votes, foreign_key: "requeriment_id"
end
