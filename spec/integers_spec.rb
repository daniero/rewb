require 'rewb'

describe Integer do
  it "is enumerable!" do
    a=*4
    expect(a).to eq [0, 1, 2, 3]

    expect(5.map { |i| i*10 }).to eql [0, 10, 20, 30, 40]

    expect(3.cycle.take(10)).to eql [0, 1, 2, 0, 1, 2, 0, 1, 2, 0]

    expect(5 % 2).to eql 1
    expect(5.map % 2).to eql [0, 2, 4]
  end

  describe :[] do
    it "works as before with a single integer" do
      expect(0b0010[0]).to eql 0
      expect(0b0010[1]).to eql 1
      expect(0b0010[2]).to eql 0
    end

    it "can take multiple parameters to mask out several bits at a time" do
      expect(0b01001110[0, 1, 4, 6, 7]).to eql 0b01000010
    end

    it "also takes a Range" do
      expect(0b0110110[1..4]).to eql 0b1011
      expect(0b0110110[1...4]).to eql 0b0011
      expect(0b0110110[2..-1]).to eql 0b1101
    end
  end

  describe :bounce do
    it "returns an array of the integers from zero up to self and down to zero again" do
      expect(5.bounce).to eql [0, 1, 2, 3, 4, 3, 2, 1, 0]
    end

    it "bounces n times given the parameter n" do
      expect(2.bounce(3)).to eql [0, 1, 0, 1, 0, 1, 0]
    end

    it "starts the opposite way when given a negative parameter" do
      expect(3.bounce(-2)).to eql [2, 1, 0, 1, 2, 1, 0, 1, 2]
      expect(4.bounce(-1)).to eql [3, 2, 1, 0, 1, 2, 3]
    end

    it "bounces up towards zero if the integer is negative" do
      expect(-3.bounce).to eql [-2, -1, 0, -1, -2]
    end
  end
end
