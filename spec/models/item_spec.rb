require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '新規登録できるとき' do
    it '値がすべて存在すれば登録できる' do
       expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do

    it '商品画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end

    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    end

    it '商品名が41文字以上では登録できない' do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name is too long (maximum is 40 characters)")
    end

    it '商品名の説明が空では登録できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info can't be blank")
    end

    it '商品名の説明が1000文字以上では登録できない' do
      @item.info = 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info is too long (maximum is 1000 characters)")
    end

    it 'カテゴリーが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end

    it '商品の状態の情報が空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Condition can't be blank")
    end
    
    it '配送料の負担が空では登録できない' do
      @item.pay_for_sipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Pay for sipping can't be blank")
    end

    it '発送元の地域の情報が空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
    end

    it '発送までの日数の情報が空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shipping day can't be blank")
    end

    it '価格の情報が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end

    it '価格が300円未満では登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
    end

    it '価格が10,000,000以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
    end

    it '価格は全角数値では登録できない' do
      @item.price = '１００'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not a number")
    end
  end
 end
