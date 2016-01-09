require_relative 'orientation'

class Robot
	attr_reader :x, :y, :orientation

	NO_LOCATION = 'Robot has not been placed'

	def place(x, y, orientation)
		@x = x
		@y = y
		@orientation = orientation
	end

	def move
		return if !placed?

		case self.orientation
			when Orientation::NORTH
				@y += 1
			when Orientation::SOUTH
				@y -= 1
			when Orientation::EAST
				@x += 1
			when Orientation::WEST
				@x -= 1
		end
	end

	def status
		return NO_LOCATION if !placed?

		[x,y,orientation[:name]].join(',')
	end

	def rotate(direction)
		return if !placed?

		@orientation = Orientation.rotate(self.orientation, direction)
	end

	def placed?
		@x && @y && @orientation
	end
end