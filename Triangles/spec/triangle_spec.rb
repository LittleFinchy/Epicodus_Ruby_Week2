require "rspec"
require "triangles"

describe("Triangle#test") do
  it("returns NOT a triangle if sides are invalid") do
    triangle = Triangle.new(1, 2, 9)
    expect(triangle.test).to(eq("NOT a Triangle"))
  end

  it("returns Equilateral if all sides are the same") do
    triangle = Triangle.new(5, 5, 5)
    expect(triangle.test).to(eq("Equilateral"))
  end

  it("returns Isosceles if exactly 2 sides are the same") do
    triangle = Triangle.new(4, 4, 5)
    expect(triangle.test).to(eq("Isosceles"))
  end

  it("returns Scalene if none of the sides are the same") do
    triangle = Triangle.new(12, 13, 15)
    expect(triangle.test).to(eq("Scalene"))
  end
end
