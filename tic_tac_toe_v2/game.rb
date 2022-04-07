require_relative "board"
require_relative "human_player"
class Game
    def initialize(n,*players)
        @players = []
        players.each{|p|@players<<HumanPlayer.new(p)}
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def reset(n)
        @board = Board.new(n)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                puts "A winner is " + @current_player.mark.to_s 
                return
            elsif @board.empty_positions?
                switch_turn
            end
        end
        @board.print
        puts " TIE!! "
    end
end
# game = Game.new(:X, :O)
# game.play