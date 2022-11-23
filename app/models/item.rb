class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :period

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }

  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999},presence: { messasge: "can't be blank"}
  validates :category_id,:situation_id,:delivery_charge_id,:address_id,:period_id, numericality: { other_than: 1 , message: "を入力してください"}
end
