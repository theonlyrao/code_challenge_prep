require "pry"

class StockPrice

  def self.get_max_profit(stock_prices)
    @result ||= []
    if stock_prices.count == 1
      self.finish(@result)
    else
      @price_with_index = stock_prices.each_with_index.map { |price, index| {index => price}  }
      max_profit = @price_with_index.reduce(self.difference(@price_with_index[0][0], @price_with_index[1][1])) do |memo, index_price|
        index = index_price.first.first
        if @price_with_index[index + 1].nil?
            @result << memo
            shifted_prices = stock_prices.drop(1)
            self.get_max_profit(shifted_prices)
        else
          next_index = index + 1
          profit = self.difference(@price_with_index[0][0], @price_with_index[next_index][next_index])
          if profit > memo
            memo = profit
          else
            memo
          end
        end
      end
    end
  end

  def self.difference(price_one, price_two)
    price_two - price_one
  end

  def self.finish(result)
    puts result.inspect
    result.max
  end

end
