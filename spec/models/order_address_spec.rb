require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do 
      @order_address = FactoryBot.build(:order_address)
    end
    describe '購入情報の保存' do
      context '購入ができるとき' do
       it 'すべての値が正しく入力されていれば保存できる' do
         expect(@order_address).to be_valid
       end
      end

      context '購入ができないとき' do
        it 'tokenが空だと保存できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空だと保存できない' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeは-を含んだ半角数字でなければ保存できない' do
          @order_address.postal_code = '1111111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid")
        end
        it 'prefecture_idが0では保存できない' do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
        end
        it 'cityが空だと保存できない' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空だと保存できない' do
          @order_address.house_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空だと保存できない' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁以上だと保存できない' do
          @order_address.phone_number = '1' * 12
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberに-があると保存できない' do
          @order_address.phone_number = '090-1234-5678'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'user_idが空だと保存できない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end


