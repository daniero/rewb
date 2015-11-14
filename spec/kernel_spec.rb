require 'rewb'

describe Kernel do

  describe :loop do
    it "loops, obviously" do
      a = []
      i = 0

      loop do
        i+= 1
        a << i
        break if i == 100
      end

      expect(a.size).to be 100
    end

    it "yields an index" do
      a = []

      loop do |i|
        break if i == 10
        a << i
      end

      expect(a).to eql [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it "returns a lazy enumerator if no block is given" do
      expect(loop.find { |i| i > 41 }).to be 42
      expect(loop.select { |i| i % 3 == 0 }.first(4)).to eql [0, 3, 6, 9]
    end
  end

end
