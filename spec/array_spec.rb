require 'rewb'

describe Array do

  describe :~@ do
    it "gives the reverted array" do
      expect(~[1,2,3]).to eql [3,2,1]
    end
  end

  describe "#reverse" do
    describe "given no arguments" do
      it "reverses the array" do
        expect([1, 2, 3].reverse).to eql [3, 2, 1]
      end
    end

    describe "given one argument" do
      it "reverses the n first elements given a positive n" do
        expect([1, 2, 3, 4, 5, 6].reverse(0)).to eql [1, 2, 3, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(1)).to eql [1, 2, 3, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(2)).to eql [2, 1, 3, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(3)).to eql [3, 2, 1, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(6)).to eql [6, 5, 4, 3, 2, 1]
      end

      it "reverses the -n last elements given a negative n" do
        expect([1, 2, 3, 4, 5, 6].reverse(-1)).to eql [1, 2, 3, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(-2)).to eql [1, 2, 3, 4, 6, 5]
        expect([1, 2, 3, 4, 5, 6].reverse(-3)).to eql [1, 2, 3, 6, 5, 4]
        expect([1, 2, 3, 4, 5, 6].reverse(-6)).to eql [6, 5, 4, 3, 2, 1]
      end
    end

    describe "given two arguments n and m" do
      it "reverses m items from index n given positive m" do
        expect([1, 2, 3, 4, 5, 6].reverse(0, 1)).to eql [1, 2, 3, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(0, 6)).to eql [6, 5, 4, 3, 2, 1]
        expect([1, 2, 3, 4, 5, 6].reverse(1, 4)).to eql [1, 5, 4, 3, 2, 6]
      end

      it "reverses items from index n up to -m from the end given a negative m" do
        expect([1, 2, 3, 4, 5, 6].reverse(0, -1)).to eql [6, 5, 4, 3, 2, 1]
        expect([1, 2, 3, 4, 5, 6].reverse(0, -4)).to eql [3, 2, 1, 4, 5, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(1, -1)).to eql [1, 6, 5, 4, 3, 2]
        expect([1, 2, 3, 4, 5, 6].reverse(2, -2)).to eql [1, 2, 5, 4, 3, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(-5, -2)).to eql [1, 5, 4, 3, 2, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(-2, -5)).to eql [1, 5, 4, 3, 2, 6]
        expect([1, 2, 3, 4, 5, 6].reverse(-5, 3)).to eql [1, 4, 3, 2, 5, 6]
      end
    end
  end

  describe :* do
    it "repeats the array when given an integer" do
      expect([1, 2, 3] * 2).to eql [1, 2, 3, 1, 2, 3]
    end

    it "returns the product when given another array" do
      expect([1, 2, 3] * ["a", "b", "c"]).to eql [[1, "a"], [1, "b"], [1, "c"],
                                                  [2, "a"], [2, "b"], [2, "c"],
                                                  [3, "a"], [3, "b"], [3, "c"]]
    end

    it "returns the product when given a range" do
      expect([1, 2, 3] * ("a".."c")).to eql [[1, "a"], [1, "b"], [1, "c"],
                                             [2, "a"], [2, "b"], [2, "c"],
                                             [3, "a"], [3, "b"], [3, "c"]]
    end
  end

  describe :** do
    it "returns the product of the array repeated n times" do
      expect([1, 2, 3]**2).to eql [[1, 1], [1, 2], [1, 3],
                                   [2, 1], [2, 2], [2, 3],
                                   [3, 1], [3, 2], [3, 3]]
    end
  end

  describe :deep_map do
    let(:tree) { [[[1, 2], 3], [4, [5]], 6] }

    it "applies the given block to each leaf node" do
      result = tree.deep_map { |e| e + 1 }

      expect(result).to eql [[[2, 3], 4], [5, [6]], 7]
    end

    it "yields each element's position as an array of indices" do
      a = []

      tree.deep_map { |x,*p| a << p }

      expect(a[0]).to eql [0, 0, 0]
      expect(a[1]).to eql [0, 0, 1]
      expect(a[2]).to eql [0, 1]
      expect(a[3]).to eql [1, 0]
      expect(a[4]).to eql [1, 1, 0]
      expect(a[5]).to eql [2]
    end
  end

end
