module StringRefinement

  def split(pattern=($;||" "), limit=-1)
    if pattern.is_a? String or pattern.is_a? Regexp
      super
    elsif pattern.is_a? Enumerable
      s = self
      pattern.map { |w| _, s = s.split(w, 2); _ } << s
    else
      super(pattern.to_s, limit)
    end
  end

end


class String
  prepend StringRefinement

  alias :/ :split
end
