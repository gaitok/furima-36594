require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能のテストコード' do
    context '商品購入できるとき' do
      it '全て値が入っている時' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building = ''
        @order.valid?
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
        @order.place_id = '1'
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

      it '電話番号は、9桁以内では購入できない' do
        @order.phone = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号は、12桁以上では購入できない' do
        @order.phone = '123456789101112'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号は、半角数字以外が含まれている場合は購入できない' do
        @order.phone = '01234567８９'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it 'userが紐付いていなければ出品できない"' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ出品できない"' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
