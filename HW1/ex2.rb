require "test/unit"

class TestRPSGameWinner < Test::Unit::TestCase

	def test_raise_wrong_player_number
		assert_raise( WrongNumberOfPlayersError ) do
			rps_game_winner [ [] ]
		end
		assert_raise( WrongNumberOfPlayersError ) do
			rps_game_winner [ [], [], [] ]
		end
	end
	
	def test_raise_wrong_strategy
		assert_raise( NoSuchStrategyError ) do
			rps_game_winner [ ["foo", "X"], [] ]
		end
	end

	def test_s_beats_p
		assert_equal(
			[ "Dave", "S" ],
			rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]) )
	end
	
end

BEATS_PLAY = { 'R' => ['S'], 'S' => ['P'], 'P' => ['R'] }
PLAYS = BEATS_PLAY.keys

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game.all? { |player| PLAYS.include? play player }
	first_p, second_p = game[0], game[1]
	
	(BEATS_PLAY[play second_p].include? play first_p) ? second_p : first_p
end

def name(player)
	player[0]
end

def play(player)
	player[1]
end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class TestRPSGameWinner < Test::Unit::TestCase

	def test_raise_wrong_player_number
		assert_raise( WrongNumberOfPlayersError ) do
			rps_game_winner [ [] ]
		end
		assert_raise( WrongNumberOfPlayersError ) do
			rps_game_winner [ [], [], [] ]
		end
	end