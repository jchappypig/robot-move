require_relative 'game_board'

def print_instructions
	puts '--------------- Welcome to iRobot --------------'
	puts '-- Please place me somewhere on a 5 * 5 grid, --'
	puts '-- so that I can move around                  --'
	puts '--                                            --'
	puts '-- Available commands:                        --'
	puts '-- > PLACE X,Y,F                              --'
	puts '-- > MOVE                                     --'
	puts '-- > LEFT                                     --'
	puts '-- > RIGHT                                    --'
	puts '-- > REPORT                  	                --'
	puts '------------------------------------------------'
end

print_instructions
game_board = GameBoard.new(5, 5)

while(true)
	command = gets
	game_board.call(command)
end


