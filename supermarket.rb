#!/usr/bin/env ruby

class Supermarket
  def self.price(catalog, cart, get_one_free_amount) 
		total_price = 0
		cart.each do |item, quantity| 
			item_price = catalog[item]
			item_subtotal = quantity*item_price
			if get_one_free_amount.include?item and quantity == get_one_free_amount[item]
				item_subtotal -= item_price
			end
			total_price += item_subtotal 
		end
		total_price
  end
end


