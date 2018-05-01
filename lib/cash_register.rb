
require 'pry'

class CashRegister

  attr_accessor :total, :discount, :last_transaction


  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @@items = []
  end

  def add_item(item, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do
      @@items << item
    end
    @last_transaction = [item, price, quantity]
  end

  def apply_discount
    return "There is no discount to apply." if @discount == nil

    @total *= 1 - (@discount * 0.01)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @@items
  end

  def void_last_transaction
    @total -= (last_transaction[1] * last_transaction[2])
    last_transaction[2].times do
      @@items.delete(last_transaction[0])
    end
  end

#binding.pry
end
