class Object
  def o
    return self unless self

    case self
    when String, Integer
      tap { |x| puts x if x }
    when Enumerable
      each { |e| e.o }
      self
    else
      tap { |x| puts x if x }
    end
  end
end

def geti
  gets.to_i
end
