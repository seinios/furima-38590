require 'rails_helper'

RSpec.describe ConsumerBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @consumer_buyer = FactoryBot.build(:consumer_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報の登録' do
    context '購入情報を正しく入力している場合' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@consumer_buyer).to be_valid
      end

      it ' buildingが空でも登録できる' do
        @consumer_buyer.building = ''
        expect(@consumer_buyer).to be_valid
      end

      it ' telが10文字でも登録できる' do
        @consumer_buyer.tel = '0801234567'
        expect(@consumer_buyer).to be_valid
      end
    end

    context '購入情報を正しく入力していない場合' do
      it 'post_codeが空では登録できない' do
        @consumer_buyer.post_code = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeがハイフンを含んだ正しいフォーマットでないと登録できない' do
        @consumer_buyer.post_code = '1234567'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include('Post code is invalid')
      end

      it 'address_idが(---)では登録できない' do
        @consumer_buyer.address_id = '1'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'municipalityが空では登録できない' do
        @consumer_buyer.municipality = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'address_numberが空では登録できない' do
        @consumer_buyer.address_number = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Address number can't be blank")
      end

      it 'telが空では登録できない' do
        @consumer_buyer.tel = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが半角数字以外では登録できない' do
        @consumer_buyer.tel = '０９０-1234-56'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include('Tel is invalid.Input only number')
      end

      it 'telの数字が9文字以下では登録できない' do
        @consumer_buyer.tel = '080123456'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include('Tel is too short')
      end

      it 'telの数字が12文字以上では登録できない' do
        @consumer_buyer.tel = '080123456789'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include('Tel is too long')
      end

      it 'user_idが空では登録できない' do
        @consumer_buyer.user_id = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @consumer_buyer.item_id = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
