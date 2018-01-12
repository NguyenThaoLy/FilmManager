class Schedule < ApplicationRecord
  paginates_per Settings.schedule.paginates_per
  belongs_to :film
  has_many :orders
  scope :schedule_info, -> {select :id, :time, :date, :price, :film_id }
end
