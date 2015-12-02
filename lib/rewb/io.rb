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

    private
    def geti(radix=10)
      gets.to_i(radix)
    end

  end
end

Object.include Rewb::IO
