require_relative 'game_board'

class GameConsole
	attr_reader :game_board

	def initialize(grid_width, grid_height)
		@game_board = GameBoard.new(grid_width, grid_height)
		@grid_width = grid_width
		@grid_height = grid_height
	end

	def start
		print_instructions(@grid_width, @grid_height)
		while(true)
			call(gets)
		end
	end

	def call(command)
		case command
			when /^PLACE (\d+),(\d+),(\w+)/i
				@game_board.place($1.to_i, $2.to_i, $3)
			when /^MOVE$/i
				@game_board.move
			when /^LEFT$/i
				@game_board.left
			when /^RIGHT$/i
				@game_board.right
			when /^REPORT$/i
				@game_board.report
			when /^EXIT/i
				exit(0)
		end
	end

	private

	def print_instructions(grid_width, grid_height)
		puts '--------------- Welcome to iRobot --------------'
		puts "-- Please place me somewhere on a #{grid_width} * #{grid_height} grid, --"
		puts '-- so that I can move around                  --'
		puts '--                                            --'
		puts '-- Available commands:                        --'
		puts '-- > PLACE X,Y,F                              --'
		puts '-- > MOVE                                     --'
		puts '-- > LEFT                                     --'
		puts '-- > RIGHT                                    --'
		puts '-- > REPORT                                   --'
		puts '-- > EXIT                                     --'
		puts '------------------------------------------------'
		puts 'Please give me a command:'
	end
end


