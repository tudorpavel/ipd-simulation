module IPDSimulation
  class Game
    def initialize(individual1, individual2)
      @player1 = individual1
      @player2 = individual2
    end

    def play_game
      # puts "** START GAME #{@player1.coop_prob} vs. #{@player2.coop_prob}"
      NR_ROUNDS.times { play_round }
      # puts "** END GAME #{@player1.score} vs. #{@player2.score}"
    end

    private

      def play_round
        @player1.play_round_against(@player2)
      end
  end
end
