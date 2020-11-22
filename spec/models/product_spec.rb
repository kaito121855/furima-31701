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
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("出品画像を選択してください")
      end
      it 'nameが空だと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空だと登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが1だと登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーは「---」以外のものを選択してください")
      end
      it 'status_idが1だと登録できない' do
        @product.status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態は「---」以外のものを選択してください")
      end
      it 'burden_idが1だと登録できない' do
        @product.burden_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担は「---」以外のものを選択してください")
      end
      it 'area_idが1だと登録できない' do
        @product.area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域は「---」以外のものを選択してください")
      end
      it 'day_idが1だと登録できない' do
        @product.day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数は「---」以外のものを選択してください")
      end
      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください", "販売価格は300〜9,999,999円の範囲で入力してください")
      end
      it 'priceが299以下の場合だと登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は300〜9,999,999円の範囲で入力してください")
      end
      it 'priceが10,000,000以上の場合だと登録できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は300〜9,999,999円の範囲で入力してください")
      end
    end
  end
end
