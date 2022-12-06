require_relative '../../lib/day06/day06'

RSpec.describe '#calculate finds the pattern start after 4 uniqie characters' do
  let(:test_01) { 'bvwbjplbgvbhsrlpgdmjqwftvncz' }
  let(:test_02) { 'nppdvjthqldpwncqszvftbrmjlhg' }
  let(:test_03) { 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' }
  let(:test_04) { 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' }

  describe 'for test_01' do
    it 'should return 5' do
     expect(calculate(test_01)).to eq(5)
    end
  end

  describe 'for test_02' do
    it 'should return 6' do
     expect(calculate(test_02)).to eq(6)
    end
  end

  describe 'for test_03' do
    it 'should return 10' do
     expect(calculate(test_03)).to eq(10)
    end
  end

  describe 'for test_04' do
    it 'should return 11' do
     expect(calculate(test_04)).to eq(11)
    end
  end
end

RSpec.describe '#calculate_02 finds the pattern start after 14 uniqie characters' do
  let(:test_01) { 'mjqjpqmgbljsphdztnvjfqwrcgsmlb' }
  let(:test_02) { 'bvwbjplbgvbhsrlpgdmjqwftvncz' }
  let(:test_03) { 'nppdvjthqldpwncqszvftbrmjlhg' }
  let(:test_04) { 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' }

  describe 'for test_01' do
    it 'should return 19' do
     expect(calculate_02(test_01)).to eq(19)
    end
  end

  describe 'for test_02' do
    it 'should return 23' do
     expect(calculate_02(test_02)).to eq(23)
    end
  end

  describe 'for test_03' do
    it 'should return 23' do
     expect(calculate_02(test_03)).to eq(23)
    end
  end

  describe 'for test_04' do
    it 'should return 29' do
     expect(calculate_02(test_04)).to eq(29)
    end
  end
end
