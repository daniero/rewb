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
