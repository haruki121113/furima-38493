require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.receiving_building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'receiving_postal_codeが空だと保存できないこと' do
        @order_address.receiving_postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiving postal code can't be blank")
      end
      it 'receiving_postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.receiving_postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiving postal code is invalid. Include hyphen(-)")
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'receiving_municipalitiesが空だと保存できない' do
        @order_address.receiving_municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiving municipalities can't be blank")
      end
      it 'receiving_house_numberが空だと保存できない' do
        @order_address.receiving_house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiving house number can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上でないと保存できない' do
        @order_address.phone_number = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが11桁以内でないと保存できない' do
        @order_address.phone_number = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが半角数値のみでないと保存できない' do
        @order_address.phone_number = '12345678abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
