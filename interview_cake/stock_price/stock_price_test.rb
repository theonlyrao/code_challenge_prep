require_relative "stock_price"
require "minitest/autorun"

class StockPriceTest < Minitest::Test

  def test_first_try
    stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

    best_profit = StockPrice.get_max_profit(stock_prices_yesterday)

    assert_equal 6, best_profit
  end

  def test_can_be_negative
    stock_prices_yesterday = [10, 5, 4]

    best_profit = StockPrice.get_max_profit(stock_prices_yesterday)

    assert_equal -1, best_profit
  end

  end
