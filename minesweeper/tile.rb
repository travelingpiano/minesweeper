

class Tile

  attr_reader :pos, :num_bombs, :flagged, :bomb

  def initialize(num, pos)

    @bomb = num
    @pos = pos
  end



end
