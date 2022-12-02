require_relative '../../lib/day02/day02'
RSpec.describe 'Calculating score for rock paper scissors game' do
  let(:input) do
    'A Y
    B X
    C Z'
  end

  it '#calculate_score should return total score from input' do
    expect(calculate_score(input)).to eq(15)
  end
end
