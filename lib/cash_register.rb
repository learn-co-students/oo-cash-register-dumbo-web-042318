require 'pry'
class CashRegister
attr_accessor :total, :discount, :quantity, :items, :currentp

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items=[]
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    @currentp = price * quantity
    @total += @currentp
    # binding.pry
    quantity.times do
      @items << title
    end
  end

  def void_last_transaction
    @total -= @currentp
    

  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= 10 * @discount
      "After the discount, the total comes to $#{@total}."
    end
  end


end
