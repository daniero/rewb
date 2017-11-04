module Rewb
  module Enumerable
    def +(other)
      Enumerator.new do |y|
        each { |e| y << e }
        other.each { |e| y << e }
      end
    end

    def *(x)
      case x
      when Numeric
        cycle(x)
      when Enumerable
        to_a * x
      else
        super
      end
    end

    def /(n)
      each_slice(size/n).to_a
    end

    def %(i)
      select.with_index { |e,j| j%i == 0 }
    end

    def group
      count = Hash.new(0)

      if block_given?
        each { |e| count[yield e]+= 1 }
      else
        each { |e| count[e]+= 1 }
      end

      count
    end

    def bounce(n=1)
      return *reverse_each.bounce(-n) if n < 0
      return self + reverse_each.drop(1) if n == 1

      bounce + bounce.drop(1) * (n - 1)
    end
  end
end

# Exclude deprecated modules and constants
constants = Module.constants - [:NIL, :TRUE, :FALSE, :Fixnum, :Bignum]

# Include Rewb::Enumerable in each existing Enumerable
classes = constants.map { |m| Module.const_get(m) }.grep(Class)
enumerables = classes.select { |c| c.included_modules.include?(Enumerable) }
enumerables.each { |e| e.include Rewb::Enumerable }

