require 'rewb'

describe Array do

  describe :~@ do
    it "gives the reverted array" do
      expect(~[1,2,3]).to eql [3,2,1]
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
  end

  describe :** do
    it "returns the product of the array repeated n times" do
      expect([1, 2, 3]**2).to eql [[1, 1], [1, 2], [1, 3],
                                   [2, 1], [2, 2], [2, 3],
                                   [3, 1], [3, 2], [3, 3]]
    end
  end

  describe :** do
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
