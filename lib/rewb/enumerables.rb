module Enumerable
  def % i
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
