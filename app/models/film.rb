class Film < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :rates
  has_many :schedules
end
