class Requeriment < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes
end
