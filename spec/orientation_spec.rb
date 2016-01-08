require 'spec_helper'
require_relative '../orientation'

describe Orientation do
	describe '.rotate' do
		context 'on south turn left' do
			it 'becomes east' do
				current_orientation = Orientation::SOUTH

				new_orientation = Orientation.rotate(current_orientation, :left)

				expect(new_orientation).to eq Orientation::EAST
			end
		end

		context 'on west turn right' do
			it 'becomes north' do
				current_orientation = Orientation::WEST

				new_orientation = Orientation.rotate(current_orientation, :right)

				expect(new_orientation).to eq Orientation::NORTH
			end
		end
	end
end