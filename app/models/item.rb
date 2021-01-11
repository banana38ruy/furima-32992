class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :shipping
  
  
  
  belongs_to :user
  has_one :item_delivery
  has_one_attached :image

 

  with_options presence: true do
    validates :image
    validates :name
    validates :expranation
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: '上記の販売価格を半角数字で入力してください' }
    
   with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :shipping_id
   end

end
