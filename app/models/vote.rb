class Vote < ApplicationRecord
  #validates :vote, :presence => true, on: :create
  validates :requirement, :presence => true, on: :create
  validates_uniqueness_of :user, scope: :requirement
  belongs_to :user, foreign_key: "user_id"
  belongs_to :requirement, foreign_key: "requirement_id"
end
