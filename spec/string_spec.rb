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

  describe :rsub do
    it "works with both strings and regulars expressions" do
      expect("Hello there".rsub("e", "a")).to eql "Hallo thara"
      expect("Hello there".rsub(/e/, "a")).to eql "Hallo thara"
    end

    it "applies substitution repeatedly" do
      expect('abcXXd'.rsub(/.X/, '')).to eql 'ad'
    end

    it "can take blocks for substitution" do
      expect('abcXXd'.rsub(/.X/){''}).to eql 'ad'
    end

    it "passes the match to the code block" do
      result = 'abcXXd'.rsub(/.X/){ |x| x.succ.swapcase }

      expect(result).to eql 'abCYyd'
    end

    it "passes matching groups as rest arguments" do
      result = 'abXcXd'.rsub(/(.)(.)X/){ |a,b,c| c+b }

      expect(result).to eql 'bcad'
    end

    it "has no side effects" do
      s = "hi there"

      s.rsub(?e, ?a)

      expect(s).to eql "hi there"
    end
  end

  describe :transpose do
    it "returns a string whose lines are this string's columns" do
      expect("abc\ndef\nghi".transpose).to eql "adg\nbeh\ncfi"
    end

    it "adds spaces to lines that are shorter than the longest line" do
      expect("abc\nd\nghi".transpose).to eql "adg\nb h\nc i"
    end

    it "does not alter the original string" do
      s = "abc\ndef\nghi"

      s.transpose

      expect(s).to eql "abc\ndef\nghi"
    end

    it "turns back to the original string when called twice (unless spaces had to be added)" do
      s = "abc\ndef\nghi"

      expect(s.transpose.transpose).to eql s
    end

    it "yields a transposed string when given a block, and returns itself un-transposed" do
      s = "abc\ndef\nghi"
      a = nil

      return_value = s.transpose { |t| a = t }

      expect(a).to eql "adg\nbeh\ncfi"
      expect(return_value).to eql "abc\ndef\nghi"
    end

    it "carries back the changes done to the yielded string" do
      s = "abc\ndef\nghi"

      return_value = s.transpose { |t| t.gsub!("beh","XYZ") }

      expect(return_value).to eql "aXc\ndYf\ngZi"
      expect(s).to eql "abc\ndef\nghi"
    end
  end

end
