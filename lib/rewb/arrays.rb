class Array
  def ~@
    reverse
  end

  def deep_map(prefix: [], &block)
    self.map.with_index do |e,i|
      new_prefix = prefix + [i]

      if e.is_a? Array
        e.deep_map(prefix: new_prefix.dup, &block)
      else
        block.call(e, *new_prefix.dup)
      end
    end
  end

end
