class Orientation
	NORTH = {name: 'NORTH', left: 'WEST', right: 'EAST'}
	SOUTH = {name: 'SOUTH', left: 'EAST', right: 'WEST'}
	EAST = {name: 'EAST', left: 'NORTH', right: 'SOUTH'}
	WEST = {name: 'WEST', left: 'SOUTH', right: 'NORTH'}

	ALL = [NORTH, SOUTH, EAST, WEST]

	class << self
		def rotate(current_orientation, direction)
			lookup(current_orientation[direction])
		end

		private

		def lookup(name)
			ALL.find { |orientation| orientation[:name] == name }
		end
	end
end