require 'rewb'

describe Array do
  describe :~@ do
    it "gives the reverted array" do
      expect(~[1,2,3]).to eql [3,2,1]
    end
  end

  describe :deep_map do
    it "applies the given block to each leaf node" do
      tree = [[[1, 2], 3], [4, [5]], 6]

      result = tree.deep_map { |e| e + 1 }

      expect(result).to eql [[[2, 3], 4], [5, [6]], 7]
    end
  end

end
