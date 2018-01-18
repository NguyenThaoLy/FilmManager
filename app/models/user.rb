class User < ApplicationRecord
  ratyrate_rater
  paginates_per Settings.user.paginates_per
  has_many :reviews, dependent: :destroy
  has_many :orders

  before_save {email.downcase!}
  validates :username, presence: true, length: {maximum: Settings.user.username.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.email.maximum},
                  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.password.minimum}
  validates :phone, presence: true
  validates :address, presence: true
  validates :sex, presence: true
  scope :user_info, -> {select :id, :username, :sex, :email, :address, :phone }
end
