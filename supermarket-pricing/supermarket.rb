#!/usr/bin/env ruby

class Supermarket
  def self.price(catalog, cart, one_for_free_required_quantities, offers) 
    total = 0
    cart.each do |item, quantity| 
      price = catalog[item]
      subtotal = calc_subtotal(quantity, price)
      subtotal = apply_one_free(subtotal, item, price, quantity, one_for_free_required_quantities)
      subtotal = apply_offers(subtotal, item, price, quantity, offers)
      total += subtotal 
    end
    total
  end
  def self.calc_subtotal(quantity, price)
    quantity*price
  end
  def self.apply_one_free(subtotal, item, price, quantity, one_for_free_required_quantities)
    amount = subtotal
    if one_for_free_required_quantities.include?item 
      remaining_quantity = quantity
      required_quantity = one_for_free_required_quantities[item]
      while remaining_quantity >= required_quantity
        amount -= price 
        remaining_quantity -= required_quantity
      end
    end
    amount
  end
  def self.apply_offers(subtotal, item, price, quantity, offers)
    amount = subtotal
    offers.each do |offer|
      if offer[:product] == item
        amount = 0
        unbilled_quantity = quantity
        while unbilled_quantity >= offer[:quantity]
          amount += offer[:price]
          unbilled_quantity -= offer[:quantity]
        end
        amount += unbilled_quantity*price
      end   
    end
    amount
  end
end


