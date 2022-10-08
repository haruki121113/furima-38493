require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'imageとmerchandise_name、merchandise_explanation、merchandise_category、merchandise_condition、delivery_charge、area、time_to_ship、merchandise_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品名が空では保存できない' do
        @item.merchandise_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.merchandise_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise explanation can't be blank")
      end
      it '商品のカテゴリーが---では保存できない' do
        @item.merchandise_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise category can't be blank")
      end
      it '商品の状態が---では保存できない' do
        @item.merchandise_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise condition can't be blank")
      end
      it '配送料の負担---では保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が---では保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が---では保存できない' do
        @item.time_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Time to ship can't be blank")
      end
      it '価格が空では保存できない' do
        @item.merchandise_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise price can't be blank")
      end
      it '価格が半角英数字でなければ保存できない' do
        @item.merchandise_price = '０いti二'
        @item.valid?
        expect(@item.errors.full_messages).to include("Merchandise price is not a number")
      end
    end
  end
end
