require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/test.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image,name,category_id,status_id,burden_id,area_id,day_id,priceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1だと登録できない' do
        @product.status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it 'burden_idが1だと登録できない' do
        @product.burden_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden must be other than 1")
      end
      it 'area_idが1だと登録できない' do
        @product.area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end
      it 'day_idが1だと登録できない' do
        @product.day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price is invalid")
      end
      it 'priceが299以下の場合だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが10,000,000以上の場合だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが全角数字の場合だと登録できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
