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

  def rsub(match, replacement=nil)
    val = dup

    if block_given?
      val.sub!(match) { yield *$~ } while val[match]
    else
      val.sub!(match, replacement) while val[match]
    end

    return val
  end

  def transpose
    if block_given?
      tmp = transpose
      yield tmp
      return tmp.transpose
    end

    chomped_lines = self.lines.map(&:chomp)
    max_length = chomped_lines.map(&:size).max

    justified_lines = chomped_lines.map { |line| line.ljust(max_length) }
    justified_lines.map(&:chars).transpose.map(&:join).join(?\n)
  end

end
