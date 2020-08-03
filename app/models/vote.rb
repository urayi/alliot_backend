class Vote < ApplicationRecord
  #validates :vote, :presence => true, on: :create
  validates :requeriment, :presence => true, on: :create
  validates_uniqueness_of :user, scope: :requeriment
  belongs_to :user, foreign_key: "user_id"
  belongs_to :requeriment, foreign_key: "requeriment_id"
end
