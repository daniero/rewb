module Rewb
  module Integer
    def each
      times { |i| yield i }
    end
  end
end

class Integer
  include Enumerable
  include Rewb::Integer
end

