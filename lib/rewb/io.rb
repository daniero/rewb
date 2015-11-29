module Rewb
  module IO
    def o
      return self unless self

      case self
      when String, Integer
        tap { |x| puts x if x }
      when Enumerable
        each { |e| e.o }
        self
      else
        tap { |x| puts x if x }
      end
    end
  end
end

class Object
  include Rewb::IO
end

def geti(radix=10)
  gets.to_i(radix)
end
