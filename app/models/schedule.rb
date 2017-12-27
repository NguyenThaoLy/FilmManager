class Schedule < ApplicationRecord
  belongs_to :film
  has_many :orders

  scope :schedule_info, -> {select(:id, :time, :date, :price, :film_id )}
end
