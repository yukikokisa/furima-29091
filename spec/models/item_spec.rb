require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
    context '商品登録がうまくいくとき' do
      it 'name,image,description,category_id,condition_id,postage_player_id,shipping_area_id,shipping_date_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字以上であれば登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'postage_player_idが1では登録できない' do
        @item.postage_player_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage player must be other than 1')
      end
      it 'shipping_area_idが1では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'shipping_date_idが1では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でなければ登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが、300以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが、9999999以上では登録できない' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
