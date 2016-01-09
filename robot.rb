require_relative 'orientation'

class Robot
	attr_accessor :x, :y, :orientation

	def place(x, y, orientation)
		self.x = x
		self.y = y
		self.orientation = orientation
	end

	def move
		case self.orientation
			when Orientation::NORTH
				self.y += 1
			when Orientation::SOUTH
				self.y -= 1
			when Orientation::EAST
				self.x += 1
			when Orientation::WEST
				self.x -= 1
		end
	end

	def status
		[x,y,orientation[:name]].join(',')
	end

	def rotate(direction)
		self.orientation = Orientation.rotate(self.orientation, direction)
	end
end