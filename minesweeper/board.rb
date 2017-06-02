require_relative "tile"

class Board
  attr_reader :grid


  def initialize(num)
    @grid = create(num)
  end

  def create(num)
    baby_grid = Array.new(num){[]}
    arr_new = []
    (0...num).each { |i| arr_new << 1 }
    (num...num * num).each { |i2| arr_new << 0 }
    arr_new.shuffle!

    (0...num).each do |n|
      # baby_grid[n] = Array.new(num) {Tile.new(0, 0)}
      (0...num).each do |n1|
        baby_grid[n][n1] = Tile.new(arr_new.pop, [n, n1])
      end
    end
    baby_grid
  end

  def find_neighbors(tile_obj)
    arr_new = []
    current = tile_obj.pos
    ((current[0]-1)..(current[0]+1)).each do |i|
      ((current[1]-1)..(current[1]+1)).each do |j|
        arr_new << grid[i][j]
      end
    end
    arr_new 
  end

  def display
    grid.each do |subs|
      puts
      subs.each do |el|
        print el.bomb
      end

    end
  end

end



board1 = Board.new(4)
# p board1.grid
# Tile.new(0, 0)
#board1.display
p board1.find_neighbors(board1.grid[1][1])
