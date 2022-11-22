class ConsumerBuyer
  include ActiveModel::Model
  attr_accessor :post_code,:address_id,:municipality,:address_number,:building,:tel,:user_id,:item_id,:token

  validates :post_code, format: { with: /[-]/ },presence: true
  validates :address_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality,:address_number,:tel,presence: true
  validates :tel, numericality: { only_integer: true, message: 'is invalid.Input only number' }
  validates :tel, length: { maximum: 11, message: "is too long" }
  validates :tel, length: { minimum: 10, message: "is too short" }
  validates :token,presence: true

  validates :user_id,:item_id,presence:true

  def save

  buyer = Buyer.create(user_id: user_id,item_id: item_id)

  Consumer.create(post_code: post_code,address_id: address_id,municipality: municipality,address_number: address_number,building: building,tel: tel,buyer_id: buyer.id)


  end
end