require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transation, :price

  def initialize(discount=nil)
    @discount = discount
    @total= 0
    @items=[]
  end

  def add_item(title, price, number=1)
    @total += (price*number)
    @price = (price*number)
    number.times do
      @items << title
    end
    # @@all << self
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = @total - (@total * (@discount*0.01))
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  # def last_transaction
  #   @last_transation = self.items.pop()
  # end

  def void_last_transaction
    @total = self.total - self.price
  end

end
# binding.pry
# true
