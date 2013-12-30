require "./supermarket"
require "test/unit"

class TC_Supermarket < Test::Unit::TestCase
  Offer = Struct.new(:product, :quantity, :price)
  def catalog
    {'Loaf of Bread' => 1, 'Noodles' => 0.5, 'Soup cans' => 2}
  end
  def test_empty_cart
    price = Supermarket.price(catalog, {}, {}, {})
    assert_equal(0, price)
  end
  def test_buy_one_product
    cart = {'Loaf of Bread' => 1}
    price = Supermarket.price(catalog, cart, {}, {})
    assert_equal(1, price)
  end
  def test_buy_one_of_each_product
    cart = {'Loaf of Bread' => 1, 'Noodles' => 1, 'Soup cans' => 1}
    price = Supermarket.price(catalog, cart, {}, {})
    assert_equal(3.5, price)
  end
  def test_buy_two_of_each_product
    cart = {'Loaf of Bread' => 2, 'Noodles' => 2, 'Soup cans' => 2}
    price = Supermarket.price(catalog, cart, {}, {})
    assert_equal(7, price)
  end
  def test_buy_two_noodles_get_one_free
    cart = {'Noodles' => 3}
    price = Supermarket.price(catalog, cart, {'Noodles' => 3}, {})
    assert_equal(1, price)
  end
  def test_buy_one_noodles_get_none_free
    cart = {'Noodles' => 1}
    price = Supermarket.price(catalog, cart, {'Noodles' => 3}, {})
    assert_equal(0.5, price)
  end
  def test_buy_three_soup_cans_for_five
    cart = {'Soup cans' => 3}
    soup_cans_offer = Offer.new("Soup cans", 3, 5)
    price = Supermarket.price(catalog, cart, {}, [soup_cans_offer])
    assert_equal(5, price)
  end
  def test_buy_four_soup_cans_with_offer_three_for_five
    cart = {'Soup cans' => 4}
    soup_cans_offer = Offer.new("Soup cans", 3, 5)
    price = Supermarket.price(catalog, cart, {}, [soup_cans_offer])
    # One soup can should be paid full price and three at offer price
    assert_equal(7, price)
  end
  def test_buy_three_soup_cans_for_five_and_five_noodles_for_two
    cart = {'Soup cans' => 3, 'Noodles'  => 5}
    soup_cans_offer = Offer.new("Soup cans", 3, 5)
    noodles_offer = Offer.new("Noodles", 5, 2)
    price = Supermarket.price(catalog, cart, {}, [soup_cans_offer, noodles_offer])
    assert_equal(7, price)
  end
end
