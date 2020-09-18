require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    
    context '商品が出品される場合' do
      
      it "nameとdescriptionとcategory_idとcondition_idとpostage_idとprefecture_idとshipping_day_idとpriceが存在すれば出品できること" do
        expect(@item).to be_valid
      end
    end  

    context '商品が出品されない場合' do

      it "nameが空では出品できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では出品できないこと" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "priceが空では出品できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "category_idを1で選択した場合出品できない事" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idを1で選択した場合出品できない事" do
        @item.condition_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "postage_idを1で選択した場合出品できない事" do
        @item.postage_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "prefecture_idを1で選択した場合出品できない事" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "shipping_day_idを1で選択した場合出品できない事" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it "priceを300円以上を記入しないと出品出来ない事" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "priceを9999999円以下を記入しないと出品出来ない事" do
        @item.price = "9999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
