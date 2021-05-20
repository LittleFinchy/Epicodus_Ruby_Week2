class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def test
    sides = [@a, @b, @c].sort()
    if sides[0..1].sum() > sides[2]
      if sides.sum() == sides[0] * 3
        return "Equilateral"
      elsif sides[0] == sides[1] || sides[1] == sides[2]
        return "Isosceles"
      else
        return "Scalene"
      end
    else
      return "NOT a Triangle"
    end
  end
end
