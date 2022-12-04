require_relative '../../lib/day01/day01'
RSpec.describe 'Finding elf with most food' do
  let(:food) do
    '1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000'
  end
  describe '#calculate' do
    it 'should return total food for top elf' do
      expect(calculate(food)).to eq(24_000)
    end
  end

  describe '#calculate_top_three' do
    it 'should return total food for top 3 elves' do
      expect(calculate_top_three(food)).to eq(45_000)
    end
  end
end
