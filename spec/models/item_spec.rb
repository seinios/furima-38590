require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '商品が投稿できる場合' do
      it '商品の情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の情報が投稿できない場合' do
      # 画像
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41文字以上では登録できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      # 商品説明
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'explanationが1001文字以上では登録できない' do
        @item.explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end

      # カテゴリー
      it 'category_idが(---)では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      # 商品の状態
      it 'situation_idが(---)では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      # 配送料の負担
      it 'delivery_charge_idが(---)では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      # 発送元の地域
      it 'address_idが(---)では登録できない' do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end
      # 発送までの日数
      it 'period_idが(---)では登録できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end

      # 販売価格
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満の半角数値では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10,000,000以上の半角数値では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが半角数値以外では登録できない' do
        @item.price = 'あア@１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザーが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
