require 'rewb'

describe Enumerable do
  describe :+ do
    it "combines this Enumerable with the other" do
      x = (1..3) + (7..9)

      expect(x.to_a).to eql [1, 2, 3, 7, 8, 9]
    end
  end

  describe :* do
    it "repeats the Enumerable n times" do
      x = (1..3) * 3

      expect(x.to_a).to eql [1, 2, 3, 1, 2, 3, 1, 2, 3]
    end
  end

  describe :% do
    it "extracts every nth element" do
      a = (0..10)

      expect(a % 3).to eql [0, 3, 6, 9]
    end
  end

  describe :group do
    let(:elements) { [1, 2, 3, 4, 4, 4, 3, 2, 2, 2, 1] }

    it "groups and counts the elements of the array" do
      expect(elements.group).to eql({1=>2, 2=>4, 3=>2, 4=>3})
    end

    it "groups by result of block if given" do
      expect(elements.group { |e| e % 2 }).to eql({0=>7, 1=>4})
    end
  end

  describe :bounce do
    it "goes through the elements forwards, then backwards" do
      expect([1, 2, 3, 4].bounce).to eql [1, 2, 3, 4, 3, 2, 1]
    end

    it "repeats n times if given a parameter" do
      expect([1, 2].bounce(4)).to eql [1, 2, 1, 2, 1, 2, 1, 2, 1]
      expect([1, 2, 3].bounce(2)).to eql [1, 2, 3, 2, 1, 2, 3, 2, 1]
    end

    it "starts at the end going backwards when given a negative parameter" do
      expect([1, 2, 3].bounce(-2)).to eql [3, 2, 1, 2, 3, 2, 1, 2, 3]
    end
  end

end
