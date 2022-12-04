require_relative '../../lib/day03/day03_part2'

RSpec.describe '#calculate' do
  let(:input) do
    'vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw'
  end

  it 'should return value of common items between 3 elves' do
    expect(calculate(input)).to eq(70)
  end
end
