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

	describe '.lookup' do
		context 'when orientation name is found' do
			it 'returns match orientation' do
				expect(Orientation.lookup('NORTH')).to eq Orientation::NORTH
			end

			it 'ignores case' do
				expect(Orientation.lookup('SOUTH')).to eq Orientation.lookup('South')
			end
		end

		context 'when orientation name is not found' do
			it 'returns nil' do
				expect(Orientation.lookup('something-not-exists')).to be_nil
			end
		end
	end
end