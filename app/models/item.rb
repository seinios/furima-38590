class Item < ApplicationRecord

  belongs_to :user
  # has_one :consumer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :period

  validates :name,:explanation,:image, presence: true

  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999},presence: { messasge: "can't be blank"}
  validates :category_id,:situation_id,:delivery_charge_id,:address_id,:period_id, numericality: { other_than: 1 , message: "can't be blank"}
end
