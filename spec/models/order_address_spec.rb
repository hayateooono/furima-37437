require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address,user_id: user.id)
    end
  
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'builbing_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

    end


    context '内容に問題がある場合' do
      
      it '郵便番号が空だと登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @order_address.post_code = '9999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は3桁ハイフン4桁の半角文字にしてください")
      end

      it '郵便番号が全角文字では登録できない' do
        @order_address.post_code = '９９９ー９９９９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は3桁ハイフン4桁の半角文字にしてください")
      end

      it '都道府県が空では登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では登録できない' do
        @order_address.phone_number = '999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値にしてください")
      end

      it '電話番号が12桁以上は登録できない' do
        @order_address.phone_number = '999999999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値にしてください")
      end

      it '電話番号に半角数値以外は登録できない' do
        @order_address.phone_number = '９９９９９９９９９９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値にしてください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end


    end
  end
end
