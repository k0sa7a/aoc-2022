require_relative '../../lib/day02/day02'
RSpec.describe '#calculate_score' do
  let(:input) do
    'A Y
    B X
    C Z'
  end

  it 'should return total score from input' do
    expect(calculate_score(input)).to eq(15)
  end
end
