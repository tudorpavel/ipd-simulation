module IPDSimulation
  class Game
    def initialize(individual1, individual2)
      @player1 = individual1
      @player2 = individual2
    end

    def play_game
      puts "** START GAME #{@player1} vs. #{@player2}"
      NR_ROUNDS.times { play_round }
      puts "** END GAME #{@player1.score} - #{@player2.score}"
    end

    private

      def play_round
        @player1.play_round_against(@player2)
      end
  end
end
