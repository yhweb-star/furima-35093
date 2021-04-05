require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '内容に問題ない場合' do
    it '全てのカラムを正しく入力すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context '内容に問題ある場合' do
    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'titleが空では登録できないこと' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'introductionが空では登録できないこと' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'category_idが1(---)では登録できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが1(---)では登録できないこと' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'postage_idが1(---)では登録できないこと' do
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it 'shipping_area_idが1(---)では登録できないこと' do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it 'shipping_days_idが1(---)では登録できないこと' do
      @item.shipping_days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが299以下では登録できないこと' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが10000000以上では登録できないこと' do
      @item.price = '12345678'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが半角数字でないと保存できないこと' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end

end
