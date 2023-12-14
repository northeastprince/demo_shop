class Order < ApplicationRecord
  has_many :items, dependent: :destroy do
    def add_from_product(product)
      if (item = find_by(product:))
        item.increment(:quantity)
      else
        item = new(product:)
      end

      item.save!
    end
  end

  enum status: {submitted: 0, fulfilled: 1}

  def total_price
    items.sum(&:total_price)
  end
end
