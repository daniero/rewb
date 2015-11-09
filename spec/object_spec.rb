require 'rewb'

describe Object do

  describe :=~ do
    it "checks the object's string representation agains the pattern" do
      expect(1234 =~ /3/).to eql 2
      expect(5678 =~ /3/).to eql nil
      expect(3.1415 =~ /\.1/).to eql 1
      expect([1, 2, 3] =~ /2/).to eql 4
    end
  end

end
