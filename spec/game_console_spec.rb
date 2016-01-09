require 'spec_helper'
require_relative '../game_console'

describe GameConsole do
	describe '#calls' do
		let(:console) { GameConsole.new(6, 6) }

		describe '#call' do
			context "when input command is 'PLACE 2,3,NORTH'" do
				it 'places robot' do
					expect(console.game_board).to receive(:place).with(2, 3, 'NORTH')

					console.send(:call, 'PLACE 2,3,NORTH')
				end
			end

			context "when input command is 'place 5,6,West'" do
				it 'places robot' do
					expect(console.game_board).to receive(:place).with(5, 6, 'West')

					console.send(:call, 'place 5,6,West')
				end
			end

			context "when input command is 'place a,b,c'" do
				it 'places robot' do
					expect(console.game_board).not_to receive(:place)

					console.send(:call, 'place a,b,EAST')
				end
			end

			context "when input command is 'move'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:move)

					console.send(:call, 'move')
				end
			end

			context "when input command is 'MOVE'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:move)

					console.send(:call, 'MOVE')
				end
			end

			context "when input command is 'right'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:right)

					console.send(:call, 'right')
				end
			end

			context "when input command is 'RIGHT'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:right)

					console.send(:call, 'RIGHT')
				end
			end

			context "when input command is 'left'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:left)

					console.send(:call, 'left')
				end
			end

			context "when input command is 'LEFT'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:left)

					console.send(:call, 'LEFT')
				end
			end

			context "when input command is 'report'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:report)

					console.send(:call, 'report')
				end
			end

			context "when input command is 'REPORT'" do
				it 'moves robot' do
					expect(console.game_board).to receive(:report)

					console.send(:call, 'REPORT')
				end
			end
		end
	end
end