class Film < ApplicationRecord
  paginates_per Settings.film.paginates_per
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :rates
  has_many :schedules
  validates :name, uniqueness: true
  scope :film_info, -> {select :id, :name, :actor, :duration, :time, :directors, :detail, :status, :poster, :trailer, :category_id }
  scope :film_show, -> {select :id, :name, :actor, :time, :directors, :detail, :status, :poster }
end
