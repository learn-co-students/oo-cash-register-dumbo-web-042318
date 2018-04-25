class CashRegister
  attr_reader :items
  attr_accessor :discount, :total, :last_item



  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def add_item(name, price, quantity = 1)
    @total += price * quantity
    quantity.times {@items << name}
    self.last_item = price * quantity
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = @total - @total * discount / 100.0
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    @total -= self.last_item
  end

end
