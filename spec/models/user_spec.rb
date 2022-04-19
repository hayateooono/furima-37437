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

    it "英字のみのパスワードは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は半角英数を両方含む必要があります")
    end

    it "数字のみのパスワードでは登録できない" do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は半角英数を両方含む必要があります")
    end

    it "全角文字を含むパスワードでは登録できない" do
      @user.password = 'AA111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは一致していないと登録できない" do
      @user.password = 'hoge1111'
      @user.password = 'hoge111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "姓（全角）が空だと登録できない" do
      @user.first_name = '太郎'
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name に全角文字を使用してください")
    end

    it "名（全角）が空だと登録できない" do
      @user.first_name = ''
      @user.last_name = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name に全角文字を使用してください")
    end

    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user.first_name = 'ほげ'
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
    end

    it "名（全角）に半角文字が含まれていると登録できない" do
      @user.first_name = 'hoge'
      @user.last_name = 'ほげ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
    end

    it "姓（カナ）が空だと登録できない" do
      @user.first_name = 'ホゲ'
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name に全角文字を使用してください")
    end

    it "名（カナ）が空だと登録できない" do
      @user.first_name = ''
      @user.last_name = 'ホゲ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name に全角文字を使用してください")
    end

    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = 'ホゲ'
      @user.last_name_kana  = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana に全角カナを使用してください")
    end

    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = 'ほげ'
      @user.last_name_kana  = 'ホゲ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana に全角カナを使用してください")
    end

    

    it "生年月日が空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end


  end
end