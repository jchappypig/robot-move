require 'spec_helper'
require_relative '../robot'
require_relative '../orientation'

describe Robot do
	let(:robot) { Robot.new }

	describe '#place' do
		context 'when is placed at 0, 0, NORTH' do
			before do
				robot.place(0, 0, Orientation::NORTH)
			end

			it 'sets position x of robot to be 0' do
				expect(robot.x).to eq 0
			end

			it 'sets position y of robot to be 0' do
				expect(robot.y).to eq 0
			end

			it 'sets orientation of robot to be NORTH' do
				expect(robot.orientation).to eq Orientation::NORTH
			end
		end

		context 'when is placed at 1, 2, SOUTH' do
			before do
				robot.place(1, 2, Orientation::SOUTH)
			end

			it 'sets position x of robot to be 1' do
				expect(robot.x).to eq 1
			end

			it 'sets position y of robot to be 2' do
				expect(robot.y).to eq 2
			end

			it 'sets orientation of robot to be NORTH' do
				expect(robot.orientation).to eq Orientation::SOUTH
			end
		end
	end

	describe '#move' do
		context 'when placed' do
			context 'when faces south' do
				it 'moves down one' do
					robot.place(2, 5, Orientation::SOUTH)

					expect{robot.move}.to change{robot.y}.by(-1)
				end
			end

			context 'when faces north' do
				it 'moves up one' do
					robot.place(6, 4, Orientation::NORTH)

					expect{robot.move}.to change{robot.y}.by(1)
				end
			end

			context 'when faces east' do
				it 'moves up one' do
					robot.place(3, 8, Orientation::EAST)

					expect{robot.move}.to change{robot.x}.by(1)
				end
			end

			context 'when faces west' do
				it 'moves up one' do
					robot.place(9, 1, Orientation::WEST)

					expect{robot.move}.to change{robot.x}.by(-1)
				end
			end
		end

		context 'when not placed yet' do
			it 'does not move x' do
				expect{robot.move}.not_to change{robot.x}
			end

			it 'does not move y' do
				expect{robot.move}.not_to change{robot.y}
			end
		end

	end

	describe '#rotate' do
		context 'when placed' do
			before do
				robot.place(4, 6, Orientation::NORTH)
			end

			it 'calculates new orientation using Orientation' do
				expect(Orientation).to receive(:rotate)

				robot.rotate(:right)
			end

			it 'changes orientation of robot' do
				allow(Orientation).to receive(:rotate).and_return(Orientation::WEST)

				robot.rotate(:left)

				expect(robot.orientation).to eq Orientation::WEST
			end
		end

		context 'when not placed yet' do
			it 'does not change orientation of robot' do
				expect(Orientation).not_to receive(:rotate)

				robot.rotate(:right)
			end
		end
	end

	describe '#status' do
		context 'when placed' do
			it 'returns status with location and orientation' do
				robot.place(1, 2, Orientation::EAST)

				expect(robot.status).to eq('1,2,EAST')
			end
		end

		context 'when not placed yet' do
			it 'returns status that robot not placed' do
				expect(robot.status).to eq('Robot has not been placed')
			end
		end
	end

	describe 'placed?' do
		context 'when has not been placed' do
			it 'returns false' do
				robot = Robot.new

				expect(robot.placed?).to be_falsey
			end
		end

		context 'when has been placed' do
			it 'returns true' do
				robot = Robot.new
				robot.place(3, 4, 'WEST')

				expect(robot.placed?).to be_truthy
			end
		end
	end
end