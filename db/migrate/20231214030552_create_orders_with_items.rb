class CreateOrdersWithItems < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :status, index: true

      t.timestamps
    end

    create_table :order_items do |t|
      t.belongs_to :order
      t.references :product
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
