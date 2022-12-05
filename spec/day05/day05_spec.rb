require_relative '../../lib/day05/day05'

RSpec.describe '#calculate' do
  let(:test_01) { './lib/day05/test_01.csv' }
  let(:test_02) { './lib/day05/test_02.csv' }
  it 'should return end-state of top row of containers' do
    expect(calculate(test_01, test_02)).to eq('CMZ')
  end
end

RSpec.describe '#calculate_9001' do
  let(:test_01) { './lib/day05/test_01.csv' }
  let(:test_02) { './lib/day05/test_02.csv' }
  it 'should return end-state of top row of containers' do
    expect(calculate_9001(test_01, test_02)).to eq('MCD')
  end
end
