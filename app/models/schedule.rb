class Schedule < ApplicationRecord
  belongs_to :film
  has_many :orders
end
