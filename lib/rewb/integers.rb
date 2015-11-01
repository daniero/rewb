class Integer
  include Enumerable

  def each
    times { |i| yield i }
  end
end

