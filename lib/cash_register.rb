class CashRegister

  attr_accessor :discount, :total, :title, :price, :quantity, :items, :transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 2)
    @title = title
    @quantity = quantity
    self.total += price * quantity

    quantity.times do
      items << title
    end
    self.transaction = total * quantity
  end

  def apply_discount
    if discount > 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
     "After the discount, the total comes to $#{self.total}."
   else
     "There is no discount to apply."
    end
  end

  def items # must push titles into items in #add_item
    @items
  end

  def void_last_transaction #must track the last transaction where it happs in  #add_item
    self.total -= transaction
  end

end
