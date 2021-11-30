# frozen_string_literal: true

# Methods for the practice Game's Life
class Game
  def initialize(height, width)
    @height = height
    @width = width
    @table = Array.new(height) { Array.new(width) }
  end

  def generate_table
    @height.times do |x|
      @width.times do |y|
        num = rand(2)
        @table[x][y] = num
      end
    end
  end

  def top_neighbours(y_position, x_position)
    top_left_neighbour = x_position.zero? || y_position.zero? ? 0 : @table[y_position - 1][x_position - 1]
    top_middle_neighbour = y_position.zero? ? 0 : @table[y_position - 1][x_position]
    top_right_neighbour = y_position.zero? || x_position == @width - 1 ? 0 : @table[y_position - 1][x_position + 1]
    top_left_neighbour + top_middle_neighbour + top_right_neighbour
  end

  def middle_neighbours(y_position, x_position)
    middle_left_neighbour = x_position.zero? ? 0 : @table[y_position][x_position - 1]
    middle_right_neighbour = x_position == @width - 1 ? 0 : @table[y_position][x_position + 1]
    middle_left_neighbour + middle_right_neighbour
  end

  def bottom_neighbours(y_position, x_position)
    bottom_left_neighbour = x_position.zero? || y_position == @height - 1 ? 0 : @table[y_position + 1][x_position - 1]
    bottom_middle_neighbour = y_position == @height - 1 ? 0 : @table[y_position + 1][x_position]
    bottom_right_neighbour = x_position == @width - 1 || y_position == @height - 1 ? 0 : @table[y_position + 1][x_position + 1]
    bottom_left_neighbour + bottom_middle_neighbour + bottom_right_neighbour
  end

  def neighbour_count(y_position, x_position)
    top_neighbours(y_position,
                   x_position) + middle_neighbours(y_position, x_position) + bottom_neighbours(y_position, x_position)
  end

  def show_table
    (0..@height).each do |i|
      print (@table[i]).to_s
      print "\n"
    end
  end

  def next_generation
    @height.times do |y|
      @width.times do |x|
        nc = neighbour_count(y, x)
        num = 0
        if nc < 2 && @table[y][x] == 1
          num = 0
        elsif nc > 3 && @table[y][x] == 1
          num = 0
        elsif [2, 3].include?(nc) && @table[y][x] == 1
          num = 1
        elsif nc == 3 && (@table[y][x]).zero?
          num = 1
        end
        @table[y][x] = num
      end
    end
  end
end

print 'Ingresa la altura: '
height = gets.to_i
print 'Ingresa la anchura: '
width = gets.to_i
puts

games = Game.new(height, width)
games.generate_table
puts 'Primera generacion'
games.show_table

games.next_generation
puts 'Segunda generacion'
games.show_table
