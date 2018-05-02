class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0.0
    @items = []
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    @transaction = price * quantity
    self.total += @transaction
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total -= self.total * (discount/100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= @transaction
  end

end
