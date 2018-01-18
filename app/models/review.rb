class Review < ApplicationRecord
  paginates_per Settings.review.paginates_per
  belongs_to :film
  belongs_to :user
  default_scope -> {order created_at: :desc}
  validates :user_id, presence: true
  validates :film_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.review.maximum}
<<<<<<< ac12b1006c6aab1f94bd12ae881413adea608519
  scope :comment, ->q{where(film_id: q).order(created_at: :desc)}
=======
>>>>>>> upload image
end
