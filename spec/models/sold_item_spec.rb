require 'rails_helper'

RSpec.describe SoldItem, type: :model do
  before do
    @order = FactoryBot.build(:sold_item)
  end

  describe '商品購入機能' do

    context '商品が購入できる時' do

      it "post_codeとprefecture_idとcityとaddressとphone_numberとtokenが存在すれば、購入できる事" do
        expect(@order).to be_valid
      end
    end

    context '商品が購入出来ない時' do
      it "post_codeが空では購入出来ない事" do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it "prefecture_idが１では購入出来ない事" do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが空では購入出来ない事" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では購入出来ない事" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では購入出来ない事" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "tokenが空では購入出来ない事" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "post_codeが９文字以上では購入出来ない事" do
        @order.post_code = "123-45678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeに文字が入っている場合では購入出来ない事" do
        @order.post_code = "横浜市"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it "cityに数字が入っている場合購入出来ない事" do
        @order.city = "123"
        @order.valid?
        expect(@order.errors.full_messages).to include("City is invalid")
      end

      it "電話番号に文字が入っている場合購入出来な事" do
        @order.phone_number = "横浜市"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
