class Board
    attr_reader :size
    def initialize(n)
        @grid = []
        n.times{@grid<<Array.new(n,:N)}
        @size = n*n
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end



    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end
    
    def place_random_ships
        n = @grid.count
        until num_ships >= size/4 do
            pos = [rand(n),rand(n)]
            self[pos] = :S
        end
    end
    
    def hidden_ships_grid
        @grid.map{|row| row.map{|e| e==:S ? e=:N : e} }
    end
    
    def self.print_grid(grid)
        grid.each{|a|puts a.join(" ")}
    end
    
    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(hidden_ships_grid)
    end
    
end
