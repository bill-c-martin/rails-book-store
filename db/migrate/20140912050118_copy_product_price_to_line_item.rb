class CopyProductPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :item_price, :decimal

    LineItem.all.each do |line_item|
      #todo - figure out why line item price is not storing, it's storing as null
      line_item.item_price = line_item.product.price
      line_item.save!
    end
  end

  def down
    remove_column :line_items, :item_price
  end
end