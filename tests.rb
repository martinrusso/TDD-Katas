require "./supermarket"
require "test/unit"

class TC_Supermarket < Test::Unit::TestCase
	def test_buy_one_product
			catalog = {'Loaf of Bread' => 1, 'Noodles' => 0.5, 'Soup cans' => 2}
			cart = {'Loaf of Bread' => 1}
			price = Supermarket.price(catalog, cart)
			assert_equal(1, price)
	end
	def test_buy_one_of_each_product
			catalog = {'Loaf of Bread' => 1, 'Noodles' => 0.5, 'Soup cans' => 2}
			cart = {'Loaf of Bread' => 1, 'Noodles' => 1, 'Soup cans' => 1}
			price = Supermarket.price(catalog, cart)
			assert_equal(3.5, price)
	end
	def test_buy_two_of_each_product
			catalog = {'Loaf of Bread' => 1, 'Noodles' => 0.5, 'Soup cans' => 2}
			cart = {'Loaf of Bread' => 2, 'Noodles' => 2, 'Soup cans' => 2}
			price = Supermarket.price(catalog, cart)
			assert_equal(7, price)
	end
end
