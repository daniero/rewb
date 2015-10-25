require 'rewb'

describe String do
  describe :split do
    it "defaults to splitting on $; or spaces" do
      expect("witness me".split).to eql %w(witness me)

      $;=/(?<=\w)[^e]+/
      expect("witness me".split).to eql %w(w e e)
    end

    it "works like before with strings and regexps" do
      expect("hey_you".split "_").to eql %w(hey you)
      expect("hey@you".split(/[^a-z]/)).to eql %w(hey you)
    end

    it "splits on first occurence of each subsequent element in an array" do
      a = ["Aa", "B", "C"]
      
      expect("aAaAabBBbCCc".split a).to eql %w(a Aab Bb Cc)
    end
  end

  describe :/ do
    it "acts like split" do
      result = "aaaxbbbxccc" / ?x

      expect(result).to eql %w(aaa bbb ccc)
    end

    it "negates :* on string arrays" do
      a = %w(one two three)
      s = "---"

      expect(a*s/s).to eql a
    end
  end
end
