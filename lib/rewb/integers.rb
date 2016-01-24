module Rewb
  module Integer
    def each
      times { |i| yield i }
    end

    def [](index, *rest)
      case index
      when Range
        range = index.last < 0 ? (index.first...bit_length) : index
        range.each_with_index.reduce(0) { |s, (i,j)| s|(super(i) << j) }
      else
        if rest.size > 0
          [index, *rest].reduce(0) { |s,i| s|super(i) << i }
        else
          super(index)
        end
      end
    end

    def bounce(n=1)
      return (-self).bounce(-n).map { |i| -i } if self < 0
      return *(0...self).bounce(n)
    end
  end
end

class Integer
  include Enumerable
end

class Fixnum
  prepend Rewb::Integer
end

class Bignum
  prepend Rewb::Integer
end


