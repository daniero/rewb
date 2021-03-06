module Rewb
  module Kernel
    private
    def loop
      return to_enum(:loop).lazy unless block_given?
      i = 0
      super do
        yield i
        i+= 1
      end
    end
  end
end

Object.prepend Rewb::Kernel
