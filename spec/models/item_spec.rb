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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では保存できない' do
        @item.merchandise_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品のカテゴリーが---では保存できない' do
        @item.merchandise_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品のカテゴリーを入力してください")
      end
      it '商品の状態が---では保存できない' do
        @item.merchandise_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担---では保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域が---では保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数が---では保存できない' do
        @item.time_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '価格が空では保存できない' do
        @item.merchandise_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格が半角英数字でなければ保存できない' do
        @item.merchandise_price = '０いti二'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格が300円未満では出品できない' do
        @item.merchandise_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it '価格が9999999円を超えると出品できない' do
        @item.merchandise_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
