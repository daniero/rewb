require 'rewb'
require 'stringio'

def capture_output
  tmp = $stdout
  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = tmp
end

def provide_input(input)
  allow_any_instance_of(Object).to receive(:gets).and_return(input)
end


describe Object do
  describe :o do
    it "prints the object if it's truthy, and returns the object" do
      string_return = nil
      integer_return = nil
      nil_return = nil
      false_return = nil

      string_output = capture_output { string_return = "hello".o }
      integer_output = capture_output { integer_return = 123.o }
      nil_output = capture_output { nil_return = nil.o }
      false_output = capture_output { false_return = false.o }

      expect(string_return).to eql "hello"
      expect(string_output).to eql "hello\n"
      expect(integer_return).to eql 123
      expect(integer_output).to eql "123\n"
      expect(nil_return).to eql nil
      expect(nil_output).to eql ""
      expect(false_return).to eql false
      expect(false_output).to eql ""
    end
  end
end

describe Enumerable do
  describe :o do
    it "prints each truhty leaf node and returns self" do
      original = [1, [true, 2, false, [3, nil, 4]]]
      return_value = nil

      output = capture_output { return_value = original.dup.o }

      expect(return_value).to eql original
      expect(output).to eql "1\n"\
                            "true\n"\
                            "2\n"\
                            "3\n"\
                            "4\n"
    end
  end
end


describe :geti do
  it "converts to given input to an integer" do
    provide_input "123\n"

    expect(geti).to eql 123
  end

  it "uses the optional parameter as radix" do
    provide_input "123\n"

    expect(geti(4)).to eq 27
  end
end
