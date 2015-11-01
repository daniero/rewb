require 'rewb'

describe Enumerable do
  describe :% do
    it "extracts every nth element" do
      a = (0..10)

      expect(a % 3).to eql [0,3,6,9]
    end
  end

end
