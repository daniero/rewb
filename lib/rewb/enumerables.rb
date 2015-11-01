module Enumerable
  def % i
    select.with_index { |e,j| j%i == 0 }
  end
end
