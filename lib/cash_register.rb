class CashRegister
    attr_accessor :discount, :total, :last_transaction, :items

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times{@items << title}
    end

    def apply_discount
        if self.discount != 0
            discount_as_percent = (100.0 - self.discount.to_f) / 100
            self.total = self.total * discount_as_percent
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
