class Board
    
    def initialize
        @grid = [['_','_','_'],['_','_','_'],['_','_','_']]
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        pos.all?{|e|e>=0 && e<= 2}
    end
    
    def empty?(pos)
        self[pos] == '_'
    end
    
    def place_mark(pos, mark)
        raise RuntimeError.new("Invalid position") if !valid?(pos)
        raise RuntimeError.new("This position is already filled.") if !empty?(pos)
        self[pos]=mark
        true
    end

    def print
        @grid.each{|r|p r}
    end

    def win_row?(mark)
        @grid.any?{|r|r.uniq==[mark]}
    end

    def win_col?(mark)
        (0...@grid.size).any? {|c|@grid.all?{|r|r[c]==mark}}
    end

    def win_diagonal?(mark)
        d1,d2=[],[]
        @grid.each_with_index do |row,i|
            d1<<row[i]
            d2<<row[-(i+1)]
        end
        [d1,d2].any?{|d|d.uniq == [mark]}
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?('_')
    end

end
