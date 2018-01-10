class Schedule < ApplicationRecord
  paginates_per Settings.schedule.paginates_per
  belongs_to :film
  has_many :orders
  scope :schedule_info, -> {select(:id, :time, :date, :price, :film_id )}

  scope :find_time_by_date, (lambda do |film_id, date|
    where(film_id: film_id, date: date)
      .pluck(:id, :time)
  end)

  scope :find_date, ->(film_id){where(film_id: film_id).distinct.pluck(:date)}
end
