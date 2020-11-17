class Product < ApplicationRecord
  has_one_attached :image
  has_one :order
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
