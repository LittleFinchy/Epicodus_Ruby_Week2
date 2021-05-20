class Parcel
  attr_accessor :id, :weight, :l, :w, :h
  @@parcels = {}
  @@total_rows = 0

  def initialize(weight, l, w, h, id)
    @weight = weight
    @l = l
    @w = w
    @h = h
    @id = id || @@total_rows += 1
  end

  def ==(other_parcel)
    self.weight == other_parcel.weight && self.l == other_parcel.l && self.w == other_parcel.w && self.h == other_parcel.h
  end

  def self.all
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.weight, self.l, self.w, self.h, self.id)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(weight, l, w, h)
    self.weight = weight
    self.l = l
    self.w = w
    self.h = h
  end

  def delete()
    @@parcels.delete(self.id)
  end

  def volume
    self.l * self.w * self.h
  end

  def cost_to_ship
    price_over20 = 0.15
    price_over40 = 0.20
    cost = 5
    if self.weight > 40
      cost += self.weight * price_over40
    elsif self.weight > 20
      cost += self.weight * price_over20
    end
    cost
  end
end
