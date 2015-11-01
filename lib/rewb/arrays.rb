class Array
  def ~@
    reverse
  end

  def deep_map
    self.map do |e|
      if e.is_a? Array
        e.deep_map { |d| yield d }
      else
        yield e
      end
    end
  end

end
