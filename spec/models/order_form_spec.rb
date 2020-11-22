require 'rails_helper'
describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'token,postal_code,prefecture_id,municipality,address,building,telephoneが存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが存在しなくても登録できること' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空だと登録できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフンを含めて入力してください（例 123-4567)")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式出ないと登録できないこと' do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号はハイフンを含めて入力してください（例 123-4567)")
      end
      it 'prefecture_idが1だと登録できないこと' do
        @order_form.prefecture_id = "1"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県は「---」以外のものを選択してください")
      end
      it 'municipalityが空だと登録できないこと' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと登録できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephoneが空だと登録できないこと' do
        @order_form.telephone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください", "電話番号は半角数字かつハイフンを含まないで入力してください")
      end
      it 'telephoneにハイフンが含んでいると登録できないこと' do
        @order_form.telephone = "010-1111-2222"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は半角数字かつハイフンを含まないで入力してください")
      end
      it 'telephoneが12桁以上だと登録できないこと' do
        @order_form.telephone = "010111122223"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号はハイフンなしで、11桁以内で入力してください")
      end
    end
  end
end
