#!/usr/bin/env ruby

class Supermarket
  def self.price(catalog, cart) 
		total_price = 0
		cart.each do |item, quantity| 
			total_price += quantity*catalog[item]
		end
		total_price
  end
end
