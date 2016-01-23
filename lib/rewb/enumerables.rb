module Rewb
  module Enumerable
    def +(other)
      Enumerator.new do |y|
        each { |e| y << e }
        other.each { |e| y << e }
      end
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
      return reverse.bounce(-n) if n < 0
      return self + reverse_each.drop(1) if n == 1

      bounce + bounce.drop(1) * (n - 1)
    end
  end
end

classes = Module.constants.map { |m| Module.const_get(m) }.grep(Class)
enumerables = classes.select { |c| c.included_modules.include?(Enumerable) }

enumerables.each { |e| e.include Rewb::Enumerable }
enumerables.each { |e| e.send(:alias_method, :*, :cycle) unless e.method_defined?(:*) }

