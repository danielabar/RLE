require './data_science'

describe DataScience do
  describe 'Run Length Encoding' do
    it 'Counts consecutive occurrences of letters in a string' do
      result = DataScience.rle('aaaabbbcca')

      a4 = Tuple.new('a', 4)
      b3 = Tuple.new('b', 3)
      c2 = Tuple.new('c', 2)
      a1 = Tuple.new('a', 1)

      expect(result).to eq([a4, b3, c2, a1])
    end

    it 'Handles alternating letters' do
      result = DataScience.rle('abab')

      a1 = Tuple.new('a', 1)
      b1 = Tuple.new('b', 1)

      expect(result).to eq([a1, b1, a1, b1])
    end
  end
end
