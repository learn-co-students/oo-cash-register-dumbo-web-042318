require 'pry'

class CashRegister
  attr_accessor :total, :discount, :quantity, :item, :price, :transaction
  attr_reader

    ITEMS = []

  def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
  end

  def add_item(item, price, quantity = 1)
    self.total = @total + (price * quantity)
    @price = price
    quantity.times do
    ITEMS << item
    @transaction = @total
    end
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    else
      @total = @total - (@total * (discount/100))
      @transaction = @total
      ITEMS.clear
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end


  def items
    ITEMS
  end


  def void_last_transaction
    @total -= @transaction
  end

end
