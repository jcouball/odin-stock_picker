# frozen_string_literal: true

RSpec.describe Odin::StockPicker do
  it 'has a version number' do
    expect(Odin::StockPicker::VERSION).not_to be nil
  end

  describe '#stock_picker' do
    subject { described_class.stock_picker(stock_prices) }

    shared_examples 'a stock picker' do |given:, it_returns:|
      let(:stock_prices) { given }

      it "returns #{it_returns.inspect} given #{given.inspect}" do
        expect(subject).to eq(it_returns)
      end
    end

    context 'with profitable scenarios' do
      it_behaves_like 'a stock picker', given: [15, 20], it_returns: [0, 1]
      it_behaves_like 'a stock picker', given: [17, 3, 6, 9, 15, 8, 6, 1, 10, 12], it_returns: [1, 4]
    end

    context 'when multiple picks with the same profit exist, it returns the first found' do
      it_behaves_like 'a stock picker', given: [1, 2, 1, 2], it_returns: [0, 1]
    end

    context 'when not given enough days' do
      it_behaves_like 'a stock picker', given: [], it_returns: nil
      it_behaves_like 'a stock picker', given: [15], it_returns: nil
    end

    context 'when there is no profitable pick' do
      it_behaves_like 'a stock picker', given: [20, 20], it_returns: nil
      it_behaves_like 'a stock picker', given: [20, 15], it_returns: nil
      it_behaves_like 'a stock picker', given: [20, 19, 15, 14, 10, 5, 3, 2, 1], it_returns: nil
    end
  end
end
