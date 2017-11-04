module Rewb
  module Array

    module Refinement
      def *(x)
        case x
        when Array
          self.product(x)
        when Range
          self.product(x.to_a)
        else
          super(x)
        end
      end

      def reverse(n=nil, m=nil)
        if m && m >= 0
          return self.reverse(m) if n == 0
          return self[0...n] + self[n, m].reverse + self[m+1..-1]
        end

        if m
          return self.reverse(m, n) if n < 0 && n > m

          x = self.length + m
          return  self[0...n] + self[n..x].reverse + self[x+1..-1]
        end

        if n
          return super() if n.abs == size
          return self if [0, 1].include? n.abs
          return self[0, n].reverse + self[n...size] if n >= 0
          return self[0...size+n] + self[n, -n].reverse
        end

        return super()
      end

    end

    def **(n)
      self.product(*[self]*(n-1))
    end
    
    def ~@
      reverse
    end

    def deep_map(prefix: [], &block)
      self.map.with_index do |e,i|
        new_prefix = prefix + [i]

        if e.is_a? Array
          e.deep_map(prefix: new_prefix.dup, &block)
        else
          block.call(e, *new_prefix.dup)
        end
      end
    end

  end
end

class Array
  include Rewb::Array
  prepend Rewb::Array::Refinement
end
