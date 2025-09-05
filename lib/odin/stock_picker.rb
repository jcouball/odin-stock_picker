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
    def self.stock_picker(days) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      return nil if days.length < 2

      max_profit = 0
      pick = nil

      # Got through all the possible days you can buy and still have a day
      # left over to sell
      possible_buy_days = days[0..-2]
      possible_buy_days.each_with_index do |buy_price, buy_index|
        # Only look at days after the buy day
        possible_sell_days = days[(buy_index + 1)..(days.length - 1)]
        possible_sell_days.each_with_index do |sell_price, sell_offset|
          profit = sell_price - buy_price

          # sell_offset is the index starting at zero after the buy_index.
          # The sell_index must be calculated based on this.
          sell_index = buy_index + sell_offset + 1

          if profit > max_profit
            max_profit = profit
            pick = [buy_index, sell_index]
          end
        end
      end

      pick
    end
  end
end
