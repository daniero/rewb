require 'rewb'

describe Range do
  describe :sum do
    it "sums the integers included in the range" do
      expect((1..100).sum).to eql 5050
      expect((0...10).sum).to eql 45
      expect((-5..5).sum).to eql 0
    end
  end
end
