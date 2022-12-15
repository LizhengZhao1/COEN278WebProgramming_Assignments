class Cart < ApplicationRecord
    has_many(:lineitems, dependent: :destroy)

    def add_this_item(product_id)
        current_item = self.lineitems.find_by(product_id: product_id)
        if current_item
            puts "======="
          current_item.quantity += 1
        else
            puts "====+++="
          current_item = self.lineitems.build(product_id: product_id)
        end
        current_item
    end
    
    def total_price
      self.lineitems.to_a.sum {|item| item.item_total_price}
    end
end
