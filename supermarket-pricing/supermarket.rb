#!/usr/bin/env ruby
  
class Supermarket
  def self.price(catalog, cart, one_for_free_required_quantities, offer) 
    total = 0
    cart.each do |item, quantity| 
      price = catalog[item]
      subtotal = calc_subtotal(quantity, price)
      subtotal = apply_one_free(subtotal, item, price, quantity, one_for_free_required_quantities)
      subtotal = apply_offer(subtotal, item, quantity, offer)
      total += subtotal 
    end
    total
  end
  def self.calc_subtotal(quantity, price)
    quantity*price
  end
  def self.apply_one_free(subtotal, item, price, quantity, one_for_free_required_quantities)
    if one_for_free_required_quantities.include?item 
      if quantity == one_for_free_required_quantities[item]
        subtotal -= price 
      end
    end
    subtotal 
  end
  def self.apply_offer(subtotal, item, quantity, offer)
    if offer[:product] == item
      if offer[:quantity] == quantity
        subtotal = offer[:price]
      end
    end   
    return subtotal
  end
end


