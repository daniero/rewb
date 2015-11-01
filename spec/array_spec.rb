require 'rewb'

describe Array do
  describe :~@ do
    it "gives the reverted array" do
      expect(~[1,2,3]).to eql [3,2,1]
    end
  end

end
