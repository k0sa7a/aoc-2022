require_relative '../../lib/day02/day02_part2'
RSpec.describe 'Calculating score for rock paper scissors game part 2' do
  let(:input) do
    'A Y
    B X
    C Z'
  end

  it '#calculate_score should return total score from input based on new rules' do
    expect(calculate_score(input)).to eq(12)
  end
end
