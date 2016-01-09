class GameBoard
	attr_reader :robot

	def initialize(grid_with=5, grid_height=5)
		@robot = Robot.new
		@grid_width = grid_with
		@grid_height = grid_height
	end

	def place(x, y, orientation_name)
		orientation = Orientation.lookup(orientation_name)

		if valid_location?(x, y) && orientation
			@robot.place(x, y, orientation)
		end
	end

	def move
		if valid_move?
			@robot.move
		end
	end

	def left
		@robot.rotate(:left)
	end

	def right
		@robot.rotate(:right)
	end

	def valid_move?
		case @robot.orientation
			when Orientation::NORTH
				@robot.y < @grid_height
			when Orientation::SOUTH
				@robot.y != 0
			when Orientation::EAST
				@robot.x < @grid_width
			when Orientation::WEST
				@robot.x != 0
		end
	end

	def valid_location?(x, y)
		x.between?(0, @grid_width) && y.between?(0, @grid_height)
	end
end