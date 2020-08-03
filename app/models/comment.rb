class Comment < ApplicationRecord
  validates :comment, :presence => true, on: :create
  validates :requirement, :presence => true, on: :create
  belongs_to :user, foreign_key: "user_id"
  belongs_to :requirement, foreign_key: "requirement_id"
end
