module Rewb
  module Enumerable
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
  end
end

classes = Module.constants.map { |m| Module.const_get(m) }.grep(Class)
enumerables = classes.select { |c| c.included_modules.include?(Enumerable) }

enumerables.each { |e| e.include Rewb::Enumerable }
enumerables.each { |e| e.send(:alias_method, :*, :cycle) unless e.method_defined?(:*) }

