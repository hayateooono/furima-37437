require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it '値がすべて存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do

    it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailは@を含めないと登録できない" do
      @user.email = 'hogehoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    
    it "passwordは5文字以下では登録できない" do
      @user.password = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordは半角英数字混合でないと登録できない" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは一致していないと登録できない" do
      @user.password = 'hoge1111'
      @user.password = 'hoge111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "名前は名字と名前どちらか空では登録できない" do
      @user.first_name = ''
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名前は全角文字でないと登録できない" do
      @user.first_name = 'hoge'
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください", "Last name に全角文字を使用してください")
    end

    it "お名前カナ(全角)は全角(カタカナ)でないと登録できない" do
      @user.first_name_kana = 'hoge'
      @user.last_name_kana  = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana に全角かなを使用してください", "Last name kana に全角かなを使用してください")
    end

    it "生年月日が空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end


  end
end