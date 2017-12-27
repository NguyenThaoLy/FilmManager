class Order < ApplicationRecord
  paginates_per Settings.order.paginates_per
  belongs_to :schedule
  belongs_to :user
  scope :order_info, -> {select(:id, :amount, :schedule_id, :user_id)}
end
