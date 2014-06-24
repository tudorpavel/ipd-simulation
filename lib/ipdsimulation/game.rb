module IPDSimulation
  class Game
    def initialize(chromosome1, chromosome2)
      @player1 = chromosome1
      @player2 = chromosome2
    end

    def play_game
      # puts "** START GAME #{@player1.coop_prob} vs. #{@player2.coop_prob}"
      NR_ROUNDS.times { play_round }
      # puts "** END GAME #{@player1.score} vs. #{@player2.score}"
    end

    private

      def play_round
        move1 = rand <= @player1.coop_prob ? '0' : '1'
        move2 = rand <= @player2.coop_prob ? '0' : '1'

        round_score1, round_score2 = case move1 + move2
        when '00' then [CC_SCORE, CC_SCORE]
        when '01' then [CD_SCORE, DC_SCORE]
        when '10' then [DC_SCORE, CD_SCORE]
        when '11' then [DD_SCORE, DD_SCORE]
        end

        @player1.score += round_score1
        @player2.score += round_score2
      end
  end
end
