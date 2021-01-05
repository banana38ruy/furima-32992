require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

  describe '新規登録/ユーザー情報' do
    context '新規登録できる時' do
      it 'passwordとpassword_confirmation,firstname,lastname(ともに全角で漢字・ひらがな・カタカナ),firstname_kana,lastname_kana(フリガナがともに全角カタカナ入力であること)
          生年月日が記入できてあれば登録できる' do
          expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationの値が違えば登録できない' do
        @user.password = "1234ab"
        @user.password_confirmation = "tosio45"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに＠がふくまれてなければ登録できない' do
        @user.email = "123reregrerf"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "23yui"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "rosinante"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "777777"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'first_nameのみ空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameのみ空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameとlast_nameが半角では登録できない' do
        @user.first_name = "gouda"
        @user.last_name = "takesi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it 'first_nameとlast_nameが英字では登録できない' do
        @user.first_name = "sunshine"
        @user.last_name = "harumaki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it 'first_nameとlast_nameが数字では登録できない' do
        @user.first_name = "1234567"
        @user.last_name = "9876576"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it 'first_name_kanaのみ空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaのみ空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaとlast_name_kanaが半角では登録できない' do
        @user.first_name_kana = "ｻﾑｲﾖ"
        @user.last_name_kana = "ﾁｮｰｻﾑｲﾖ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください", "Last name kana 全角文字でカナを使用してください")
      end
      it 'first_name_kanaとlast_name_kanaが漢字では登録できない' do
        @user.first_name_kana = "四暗刻"
        @user.last_name_kana = "大三元"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください", "Last name kana 全角文字でカナを使用してください")
      end
      it 'first_name_kanaとlast_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = "げいのうじんは"
        @user.last_name_kana = "はがいのち"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください", "Last name kana 全角文字でカナを使用してください")
      end
      it 'first_name_kanaとlast_name_kanaが英字では登録できない' do
        @user.first_name_kana = "strawberry"
        @user.last_name_kana = "milkshake"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください", "Last name kana 全角文字でカナを使用してください")
      end
      it 'first_name_kanaとlast_name_kanaが数字では登録できない' do
        @user.first_name_kana = "777777"
        @user.last_name_kana = "666666"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください", "Last name kana 全角文字でカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  
    describe 'ログイン/ユーザー情報' do
      context 'ログインできる時' do
        it '登録したemailとpasswordを記入できてあればログインできる' do
            expect(@user).to be_valid
        end
      end
      context 'ログインできないとき' do
        it 'emailが空ではログインできない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空ではログインできない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '登録したemailに対してパスワードが違えばログインできない' do
          @user.password = "123abc"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
  
  
  
  
  
  
  
  
  
  
  
  end
end
end
