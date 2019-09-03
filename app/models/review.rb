class Review < ApplicationRecord
  paginates_per Settings.review.paginates_per
  belongs_to :film
  belongs_to :user
  validates :user_id, presence: true
  validates :film_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.review.maximum}
  scope :comment, ->q{where(film_id: q).order(created_at: :desc)}
end
