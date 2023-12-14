class Order::Item < ApplicationRecord
  belongs_to :order, default: -> { Current.order }, touch: true

  belongs_to :product, required: false

  validates :price, :quantity, :name, presence: true
  validates :price, :quantity, numericality: {greater_than: 0}

  before_validation :set_attributes_from_product, on: :create, if: -> { product.present? }

  def total_price
    price * quantity
  end

  private

  def set_attributes_from_product
    self.name ||= product.name
    self.price ||= product.price
  end
end
