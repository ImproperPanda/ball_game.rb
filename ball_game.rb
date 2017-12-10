

class Ball
    
    #Eventually, I will have 'power-ups' that USER can pick up. Leaving this in will give me access to this attribute later
    attr_accessor :more_moves
    
    def initialize ( x_position, y_position, moves_remaining )
        @x_position = x_position
        @y_position = y_position
        @moves_remaining = moves_remaining
    end
    
    
    #These next 4 methods adjust the position of the ball on an X, Y axis
    def roll_left
        @x_position -= 1
        @moves_remaining -= 1
    end
    def roll_right
        @x_position += 1
        @moves_remaining -= 1
    end
    def roll_up
        @y_position += 1
        @moves_remaining -= 1
    end
    def roll_down
        @y_position -= 1
        @moves_remaining -= 1
    end

    
    #These next 2 methods makes sure the BAll is not out of bounds and has enough moves remaining
    def more_moves
        @moves_remaining > 0
    end
    def out_of_position
        (@x_position > 0 && @x_position <= 10) && (@y_position > 0 && @y_position <= 10)
    end

     
     #This displays to the USER the BALL's X, Y position and how many moves the USER has remaining    
    def display_stats
        puts "BALL at Positions : [#{@x_position}, #{@y_position}]\nMOVES remaining : #{@moves_remaining}"
    end
    
end


#The position of the ball will be assigned randomly
l = rand(1...10); r = rand(1...10)
b = Ball.new(l, r, 6)

b.display_stats

def game(x)
    if x.more_moves == false
        puts "You are out of moves.\n***GAME OVER***"
    elsif x.out_of_position == false
        puts "You are out of bounds.\n***GAME OVER***"
    else
        puts "Where would you like to roll? [LEFT, RIGHT, UP or DOWN] \nor type DISPLAY STATS"
        choice = gets.chomp
        choice.downcase!
        case choice
        when "left"
            x.roll_left
        when "right"
            x.roll_right
        when "up"
            x.roll_up
        when "down"
            x.roll_down
        when "display stats"
            x.display_stats
        else
            "Sorry, command not recognized."
        end
        return game(x)
    end
end


puts game(b)
