require_relative "piece.rb"

class Board

    def initialize()
        @rows = Array.new(8) {Array.new(8,nil)}
        @piece = Piece.new()
    end


    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @rows[row][col] = value
    end

    def add_piece(pos)
        if self[pos] == nil
            self[pos] = @piece
            return true
        else
            return false
        end
    end

    def move_piece(start_pos, end_pos)
        self[start_pos] = nil
        self[end_pos] = @piece
    end

end









