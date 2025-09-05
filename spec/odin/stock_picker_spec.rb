# frozen_string_literal: true

RSpec.describe Odin::StockPicker do
  it 'has a version number' do
    expect(Odin::StockPicker::VERSION).not_to be nil
  end

  describe '#stock_picker' do
    subject { described_class.stock_picker(stock_prices) }

    context 'with no days' do
      let(:stock_prices) { [] }
      it { is_expected.to eq(nil) }
    end

    context 'with one day' do
      let(:stock_prices) { [15] }
      it { is_expected.to eq(nil) }
    end

    context 'with two days' do
      let(:stock_prices) { [15, 20] }
      it { is_expected.to eq([0, 1]) }
    end

    context 'when the best recommendation breaks even' do
      context 'with two stock prices' do
        let(:stock_prices) { [20, 20] }
        it { is_expected.to eq(nil) }
      end
    end

    context 'when the best recommendation loses money' do
      context 'with two stock prices' do
        let(:stock_prices) { [20, 15] }
        it { is_expected.to eq(nil) }
      end

      context 'with many stock prices' do
        let(:stock_prices) { [20, 19, 15, 14, 10, 5, 3, 2, 1] }
        it { is_expected.to eq(nil) }
      end
    end

    context 'with ten days' do
      let(:stock_prices) { [17, 3, 6, 9, 15, 8, 6, 1, 10, 12] }
      it { is_expected.to eq [1, 4] }
    end
  end
end
