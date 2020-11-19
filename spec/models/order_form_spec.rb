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
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式出ないと登録できないこと' do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが1だと登録できないこと' do
        @order_form.prefecture_id = "1"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと登録できないこと' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと登録できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと登録できないこと' do
        @order_form.telephone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid")
      end
      it 'telephoneにハイフンが含んでいると登録できないこと' do
        @order_form.telephone = "010-1111-2222"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが12桁以上だと登録できないこと' do
        @order_form.telephone = "010111122223"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
      end
    end
  end
end
