#!/usr/bin/env ruby

class Supermarket
  def self.price(catalog, cart, one_4_free_amounts) 
		total = 0
		cart.each do |item, quantity| 
			price = catalog[item]
			subtotal = calc_subtotal(quantity, price)
			subtotal = apply_one_free(subtotal, item, price, quantity, one_4_free_amounts)
			total += subtotal 
		end
		total
  end

	def self.calc_subtotal(quantity, price)
		quantity*price
  end

	def self.apply_one_free(subtotal, item, price, quantity, one_4_free_amounts)
			if one_4_free_amounts.include?item and quantity == one_4_free_amounts[item]
				subtotal -= price
			end
			subtotal 
	end
end


