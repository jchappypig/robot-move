require 'spec_helper'
require_relative '../game_board'
require_relative '../robot'
require_relative '../orientation'

describe GameBoard do
	grid_width = 5
	grid_height = 5

	let(:game_board) { GameBoard.new(grid_width, grid_height) }

	describe '#place' do
		context 'when on valid location' do
			context 'but face to invalid orientation' do
				it 'does not place robot' do
					allow(game_board).to receive(:valid_location?).with(2, 5).and_return(true)
					allow(Orientation).to receive(:lookup).with('InvalidOrientation').and_return(nil)

					expect(game_board.robot).not_to receive(:place)

					game_board.place(2, 5, 'InvalidOrientation')
				end
			end

			context 'and face to valid orientation' do
				it 'places robot' do
					allow(game_board).to receive(:valid_location?).with(3, 4).and_return(true)
					allow(Orientation).to receive(:lookup).with('NORTH').and_return(Orientation::NORTH)

					expect(game_board.robot).to receive(:place).with(3, 4, Orientation::NORTH)

					game_board.place(3, 4, 'NORTH')
				end
			end
		end

		context 'when on invalid location' do
			context 'and face to invalid orientation' do
				it 'does not place robot' do
					allow(game_board).to receive(:valid_location?).with(4, 6).and_return(false)
					allow(Orientation).to receive(:lookup).with('InvalidOrientation').and_return(nil)

					expect(game_board.robot).not_to receive(:place)

					game_board.place(4, 6, 'InvalidOrientation')
				end
			end

			context 'and face to valid orientation' do
				it 'does not place robot' do
					allow(game_board).to receive(:valid_location?).with(-1, 2).and_return(false)
					allow(Orientation).to receive(:lookup).with('WEST').and_return(Orientation::WEST)

					expect(game_board.robot).not_to receive(:place)

					game_board.place(-1, 2, 'WEST')
				end
			end
		end
	end

	describe '#move' do
		context 'when valid move' do
			it 'moves robot' do
				game_board.place(0, 0, 'EAST')
				allow(game_board).to receive(:valid_move?).and_return(true)

				expect(game_board.robot).to receive(:move)

				game_board.move
			end
		end

		context 'when invalid move' do
			it 'does not move robot' do
				game_board.place(0, 0, 'WEST')
				allow(game_board).to receive(:valid_move?).and_return(false)

				expect(game_board.robot).not_to receive(:move)

				game_board.move
			end
		end
	end

	describe '#left' do
		it 'turns robot to the left' do
			expect(game_board.robot).to receive(:rotate).with(:left)

			game_board.left
		end
	end

	describe '#left' do
		it 'turns robot to the left' do
			expect(game_board.robot).to receive(:rotate).with(:left)

			game_board.left
		end
	end

	describe '#right' do
		it 'turns robot to the right' do
			expect(game_board.robot).to receive(:rotate).with(:right)

			game_board.right
		end
	end

	describe '#valid_move?' do
		context 'when robot is facing north' do
			context 'and when robot is at the most north' do
				it 'is not valid' do
					game_board.place(1, grid_height, 'NORTH')

					expect(game_board.valid_move?).to be_falsey
				end
			end

			context 'and when robot is not at most north' do
				it 'is valid' do
					game_board.place(1, grid_height-1, 'NORTH')

					expect(game_board.valid_move?).to be_truthy
				end
			end
		end

		context 'when robot is facing south' do
			context 'and when robot is at the most south' do
				it 'is not valid' do
					game_board.place(1, 0, 'SOUTH')

					expect(game_board.valid_move?).to be_falsey
				end
			end

			context 'and when robot is not at most south' do
				it 'is valid' do
					game_board.place(1, 1, 'SOUTH')

					expect(game_board.valid_move?).to be_truthy
				end
			end
		end

		context 'when robot is facing east' do
			context 'and when robot is at the most east' do
				it 'is not valid' do
					game_board.place(grid_width, 1, 'EAST')

					expect(game_board.valid_move?).to be_falsey
				end
			end

			context 'and when robot is not at most east' do
				it 'is valid' do
					game_board.place(grid_width-1, 1, 'EAST')

					expect(game_board.valid_move?).to be_truthy
				end
			end
		end

		context 'when robot is facing west' do
			context 'and when robot is at the most west' do
				it 'is not valid' do
					game_board.place(0, 1, 'WEST')

					expect(game_board.valid_move?).to be_falsey
				end
			end

			context 'and when robot is not at most west' do
				it 'is valid' do
					game_board.place(1, 1, 'WEST')

					expect(game_board.valid_move?).to be_truthy
				end
			end
		end
	end

	describe 'valid_location?' do
		let(:game_board) { GameBoard.new(2, 2) }

		context 'when within the grid' do
			[{x: 0, y: 1}, {x: 1, y: 1}, {x: 1, y: 0}, {x: 0, y: 0}].each do |location|
				it "is valid on x: #{location[:x]}, y: #{location[:y]}" do
					expect(game_board.valid_location?(location[:x], location[:y])).to be_truthy
				end
			end
		end

		context 'when not within the grid' do
			[{x: -1, y: 1}, {x: 3, y: 1}, {x: -1, y: -1}, {x: 1, y: -1}, {x: 1, y: -1}, {x: 1, y: 3}].each do |location|
				it "is valid on x: #{location[:x]}, y: #{location[:y]}" do
					expect(game_board.valid_location?(location[:x], location[:y])).to be_falsey
				end
			end
		end
	end

	describe '#call' do
		context "when input command is 'PLACE 2,3,NORTH'" do
			it 'places robot' do
				expect(game_board).to receive(:place).with(2, 3, 'NORTH')

				game_board.call('PLACE 2,3,NORTH')
			end
		end

		context "when input command is 'place 5,6,West'" do
			it 'places robot' do
				expect(game_board).to receive(:place).with(5, 6, 'West')

				game_board.call('place 5,6,West')
			end
		end

		context "when input command is 'place a,b,c'" do
			it 'places robot' do
				expect(game_board).not_to receive(:place)

				game_board.call('place a,b,EAST')
			end
		end

		context "when input command is 'move'" do
			it 'moves robot' do
				expect(game_board).to receive(:move)

				game_board.call('move')
			end
		end

		context "when input command is 'MOVE'" do
			it 'moves robot' do
				expect(game_board).to receive(:move)

				game_board.call('MOVE')
			end
		end

		context "when input command is 'right'" do
			it 'moves robot' do
				expect(game_board).to receive(:right)

				game_board.call('right')
			end
		end

		context "when input command is 'RIGHT'" do
			it 'moves robot' do
				expect(game_board).to receive(:right)

				game_board.call('RIGHT')
			end
		end

		context "when input command is 'left'" do
			it 'moves robot' do
				expect(game_board).to receive(:left)

				game_board.call('left')
			end
		end

		context "when input command is 'LEFT'" do
			it 'moves robot' do
				expect(game_board).to receive(:left)

				game_board.call('LEFT')
			end
		end

		context "when input command is 'report'" do
			it 'moves robot' do
				expect(game_board).to receive(:report)

				game_board.call('report')
			end
		end

		context "when input command is 'REPORT'" do
			it 'moves robot' do
				expect(game_board).to receive(:report)

				game_board.call('REPORT')
			end
		end
	end

	describe '#report' do
		it 'returns status of robot' do
			expect(game_board.robot).to receive(:status)

			game_board.report
		end
	end
end