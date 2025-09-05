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

      max_profit = 0
      pick = nil

      (0..(days.length - 2)).each do |buy_day|
        buy_price = days[buy_day]
        ((buy_day + 1)..(days.length - 1)).each do |sell_day|
          sell_price = days[sell_day]
          profit = sell_price - buy_price
          if profit > max_profit
            max_profit = sell_price - buy_price
            pick = [buy_day, sell_day]
          end
        end
      end

      pick
    end
  end
end
