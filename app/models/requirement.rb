class Requirement < ApplicationRecord
  validates :title, :presence => true, on: :create
  validates :content, :presence => true, on: :create
  belongs_to :user, foreign_key: "user_id"
  has_many :comments, foreign_key: "requirement_id"
  has_many :votes, foreign_key: "requirement_id"
end
