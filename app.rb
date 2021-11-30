class Game
    def initialize (height, width)
        @height = height
        @width = width
        @table = Array.new(height) { Array.new (width)}
    end

    def generate_Table
        @height.times do |x|
            @width.times do |y|
                num = rand(2)
                @table[x][y] = num
            end
        end
    end

    def neighbour_Count(x_position, y_position)
        topLeftNeighbour = if x_position == 0 || y_position == 0 then 0 else @table[x_position - 1][y_position - 1] end
        topMiddleNeighbour = if y_position == 0 then 0 else @table[x_position][y_position - 1] end
        topRightNeighbour = if y_position == 0 || x_position == @width then 0 else @table[x_position + 1][y_position - 1] end

        middleLeftNeighbour = if x_position == 0 then 0 else @table[x_position - 1][y_position] end
        middleRightNeighbour = if x_position == @width then 0 else @table[x_position + 1][y_position] end

        bottomLeftNeighbour = if x_position == 0 || y_position == @height then 0 else @table[x_position - 1][y_position + 1] end
        bottomMiddleNeighbour = if y_position == @height then 0 else @table[x_position][y_position + 1] end
        bottomRightNeighbour = if x_position == @width then 0 else @table[x_position + 1][y_position + 1] end

        neighbours =
          topLeftNeighbour + topMiddleNeighbour + topRightNeighbour +
          middleLeftNeighbour + middleRightNeighbour +
          bottomLeftNeighbour + bottomMiddleNeighbour + bottomRightNeighbour

    end

    def show_Table
        for i in (0..@height)
            print "#{@table[i]}"
            print "\n"
        end
    end

    def next_Generation
        for i in (0..@height)
            row = []
            for j in (0..@width)
                nc = neighbour_Count(i,j)
                if nc == 3
                    row[j] = 1
                elsif nc < 2
                    row[j] = 0
                elsif nc > 3 && @table[i][j] == 1
                    row[j] = 0
                elsif nc == 2 || nc == 3
                    row[j] = 1
                end
            end
        end
    end
end

puts 'Ingresa la altura: '
height = gets.to_i
puts 'Ingresa la anchura: '
width = gets.to_i

games = Game.new(height, width)
games.generate_Table
games.show_Table
puts games.neighbour_Count(4,4)