# frozen_string_literal: true

require_relative 'stock_picker/version'

module Odin
  # Holds the implementation of stockpicker
  module StockPicker
    # Given a list of daily stock prices, picks the best day to have bought and sold
    #
    # Returns nil if days is empty or just contains one day. Also returns nil if
    # there was no pick that makes money.
    #
    # @param days [Array<Integer>] the price of the stock for each day
    #
    # @return [Array<Integer, Integer>] the best day to have bought (index 0) and sold (index 1)
    #
    def self.stock_picker(days) # rubocop:disable Metrics/MethodLength
      return nil if days.length < 2

      # Initialize with the first day as the lowest price seen so far
      min_price = days[0]
      min_price_index = 0

      max_profit = 0
      best_days = nil

      # Iterate through the days to find the best day to sell
      days.each_with_index do |current_price, current_index|
        # Skip the first day since we can't sell on the same day we start
        next if current_index.zero?

        # Check if selling today yields a better profit than what we've seen
        profit = current_price - min_price
        if profit > max_profit
          max_profit = profit
          best_days = [min_price_index, current_index]
        end

        # Check if today's price is a new low point to buy at
        if current_price < min_price
          min_price = current_price
          min_price_index = current_index
        end
      end

      best_days
    end
  end
end
