module Rewb
  module Range
    def sum
      (min + max) * size / 2
    end
  end
end

Range.include Rewb::Range
