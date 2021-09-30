require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @order = FactoryBot.build(:buy_address)
    @buy = FactoryBot.build(:buy)
  end

  describe '商品購入機能のテストコード' do
    context '商品購入できるとき' do
      it '全て値が入っている時' do
        expect(@order).to be_valid
      end
    end

    context '商品登録ができない時' do

      it 'トークンが空だと入力できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと入力できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid')
      end

      it '都道府県に「---」が選択されている場合は出品できない' do
        @order.place_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Place can't be blank")
      end

      it '市区町村が空だと入力できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと入力できない' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it '建物名は任意である' do
        @order.building = ''
        @order.valid?
      end

      it '電話番号が空だと入力できない' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

    end
  end
end
