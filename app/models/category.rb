class Category < ApplicationRecord
  paginates_per Settings.category.paginates_per
  has_many :films
  scope :category_info, -> {select(:id, :name)}
end
