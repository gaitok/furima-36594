require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品のテストコード' do
    context '商品登録できるとき' do
      it '全て値が入っている時' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it '商品名が空だと入力できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品説明が空だと入力できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '商品画像が空だと入力できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーが空だと入力できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が空だと入力できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料が空だと入力できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '配送地域が空だと入力できない' do
        @item.place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it '配送日数が空だと入力できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '値段が空だと入力できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '値段が半角数値以外だと入力できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300円未満では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it 'userが紐付いていなければ出品できない"' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
