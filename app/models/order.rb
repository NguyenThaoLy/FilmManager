class Order < ApplicationRecord
  paginates_per Settings.order.paginates_per
  belongs_to :schedule
  belongs_to :user
  enum status: %i(Unchecked Approved Done)
  scope :order_info, -> {select :id, :amount, :status, :schedule_id, :user_id}
end
