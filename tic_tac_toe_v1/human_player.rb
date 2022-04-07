class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'Player turn'
        puts @mark
        puts 'enter a position with coordinates separated with a space like `4 7` or something'
        input = gets.chomp
        exit if input == 'exit'
        raise RuntimeError.new("Invalid input") if input.chars.any?{|c|!"1234567890 ".include?(c)}
        input = input.split.map(&:to_i)
        raise RuntimeError.new("Incorrect number of coordinates") if input.count != 2
        input
    end

end
