require_relative "board"
require_relative "human_player"
class Game
    def initialize(p1,p2)
        @p1 = HumanPlayer.new(p1)
        @p2 = HumanPlayer.new(p2)
        @board = Board.new
        @current_player = @p1
    end

    def switch_turn
        @current_player = @current_player == @p1 ? @p2 : @p1
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