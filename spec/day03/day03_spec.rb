require_relative '../../lib/day03/day03'

RSpec.describe 'Sorting backpacks' do
  let(:input) do
    'vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw'
  end

  it '#calculate should return value of replicated items' do
    expect(calculate(input)).to eq(157)
  end
end
