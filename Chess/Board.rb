require_relative "piece.rb"

class Board

    def initialize()
        @rows = Array.new(8) {Array.new(8,nil)}
    end


    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @rows[row][col] = value
    end


    def move_piece(start_pos, end_pos)
        # piece = Piece.new()
    end

end













# class NullPiece < Piece

#     def initialize(start_pos = nil)
#         @start_pos = start_pos

#     end

# end