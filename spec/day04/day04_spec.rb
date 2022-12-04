require_relative '../../lib/day04/day04'

RSpec.describe 'Calculating overlapping work for elf cleaners' do
  let(:test) { './lib/day04/test.csv' }

  describe '#calculate' do
    it 'should return number of fully overlapping pairs' do
      expect(calculate(test)).to eq(2)
    end
  end

  describe '#calculate_any_overlap' do
    it 'should return number of all partially overlapping pairs' do
      expect(calculate_any_overlap(test)).to eq(4)
    end
  end
end
