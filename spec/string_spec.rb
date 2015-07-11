require 'rewb'

describe String do
  describe "/" do
    it "acts like split" do
      result = "aaaxbbbxccc" / ?x

      expect(result).to eql %w(aaa bbb ccc)
    end

    it "negates `:*` on string arrays" do
      a = %w(one two three)
      s = ","

      expect(a*s/s).to eql a
    end
  end
end
