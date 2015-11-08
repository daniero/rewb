require 'rewb'

describe Enumerable do
  describe :% do
    it "extracts every nth element" do
      a = (0..10)

      expect(a % 3).to eql [0,3,6,9]
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

end
