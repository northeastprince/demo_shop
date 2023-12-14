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

  validates :items, on: :submit, presence: {message: "must have at least one item"}

  validates :total_price, numericality: {less_than_or_equal_to: 99_999_999.99}

  broadcasts_refreshes

  def total_item_count
    items.sum(:quantity)
  end

  def total_price
    items.sum(&:total_price)
  end

  def submit
    self.status = :submitted

    save!(context: :submit)
  end
end
