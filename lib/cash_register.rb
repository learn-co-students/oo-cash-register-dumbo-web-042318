require "pry"

class CashRegister
  attr_accessor :total, :discount, :last_price_added, :all_items

  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @all_items = []
  end

  def add_item(item, price, quantity = nil)
    @last_price_added = price

    if quantity
      quantity.times do
        @all_items << item
      end
      @total += price * quantity
    else
      @all_items << item
      @total += price
    end
  end

  def apply_discount
    if @discount
      @total *= (1.0 - discount / 100.0)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @all_items.pop
    @total -= last_price_added
  end
end
