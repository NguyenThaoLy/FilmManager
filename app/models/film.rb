class Film < ApplicationRecord
  paginates_per Settings.film.paginates_per
  ratyrate_rateable "average"
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :schedules
  validates :name, uniqueness: true
  mount_uploader :poster, ImageUploader
  validate :poster_size
  scope :film_info, -> {select :id, :name, :actor, :duration, :time, :directors, :detail, :status, :poster, :trailer, :category_id }
  scope :film_show, -> {select :id, :name, :actor, :time, :directors, :detail, :status, :poster }

  private

  def poster_size
    if poster.size > 5.megabytes
      errors.add :post, t("models.film.error")
    end
  end
end
