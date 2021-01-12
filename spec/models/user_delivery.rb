require 'rails_helper'

RSpec.describe UserDelivery, type: :model do
  describe '#create' do
   before do
    @user_delivery = FactoryBot.build(:user_delivery)
end

   describe '商品購入機能の確認' do
     context '商品購入ができる時' do
       it 'postal_code,municipalities,address,phone_numberを記述すること
          prefecture_idの選択肢を選択することとtokenがあれば保存ができること' do 
          expect(@user_delivery).to be_valid
       end
       it '建物名の入力が空でも購入ができる' do
        @user_delivery.building_name = nil
        expect(@user_delivery).to be_valid
       end
     end
     context '商品購入ができないとき' do
      it 'tokenが空では購入できない' do
        @user_delivery.token = nil
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号の入力が空では購入できない' do
        @user_delivery.postal_code = nil
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号の入力にハイフンがないと購入できない' do
        @user_delivery.postal_code = "3900857"
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Postal code Postal code Input correctly")
      end
      it '市町村の入力が空では購入できない' do
        @user_delivery.municipalities = nil
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地の入力が空では購入できない' do
        @user_delivery.address = nil
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号の入力が空では購入できない' do
        @user_delivery.phone_number = nil
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @user_delivery.phone_number = "093-07-3433"
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号が11桁より入力数が多いと購入できない' do
        @user_delivery.phone_number = "000077774444"
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '都道府県の選択が未選択では購入できない' do
        @user_delivery.prefecture_id = 1
        @user_delivery.valid?
        expect(@user_delivery.errors.full_messages).to include("Prefecture Select")
      end
      
       
     end
   end   
  end
end