module Rewb
  module String

    module Refinement
      def split(pattern=($;||" "), limit=-1)
        if pattern.is_a? String or pattern.is_a? Regexp
          super
        elsif pattern.is_a? Enumerable
          s = self
          pattern.map { |w| _, s = s.split(w, 2); _ } << s
        else
          super(pattern.to_s, limit)
        end
      end
    end

    def +@
      self['.'] ? to_f : to_i
    end

    def coerce n
      [n, +self]
    end

    def ~@
      reverse
    end

    def rsub(match, replacement=nil)
      val = dup

      if block_given?
        val.sub!(match) { yield *$~ } while val[match]
      else
        val.sub!(match, replacement) while val[match]
      end

      return val
    end

    def transpose
      if block_given?
        tmp = transpose
        yield tmp
        return tmp.transpose
      end

      chomped_lines = self.lines.map(&:chomp)
      max_length = chomped_lines.map(&:size).max

      justified_lines = chomped_lines.map { |line| line.ljust(max_length) }
      justified_lines.map(&:chars).transpose.map(&:join).join(?\n)
    end

    def char_count
      count = Hash.new(0)
      chars { |c| count[c]+= 1}
      count
    end

    def bin
      self.to_i(2)
    end

  end
end

class String
  include Enumerable
  alias_method :each, :each_char

  include Rewb::String
  prepend Rewb::String::Refinement

  alias_method :/, :split
end
