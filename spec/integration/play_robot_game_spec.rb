require_relative '../spec_helper'
require_relative '../../game_console'

describe 'play robot game' do
	it 'reports correct robot status' do
		expect(STDOUT).to receive(:puts).with('3,3,NORTH')

		console = GameConsole.new(5, 5)

		console.call('PLACE 1,2,EAST')
		console.call('MOVE')
		console.call('MOVE')
		console.call('LEFT')
		console.call('MOVE')
		console.call('REPORT')
	end
end