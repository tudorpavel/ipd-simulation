module IPDSimulation
  class Individual
    attr_accessor :genes, :score

    def initialize(args = {})
      self.genes = args[:genes].nil? ? default_genes : args[:genes].clone
      self.score = args[:score] || 0
    end

    def mutate!
      gene = rand(genes.length)
      genes[gene] = rand
      # genes[gene] += [-1, 1].sample * MUTATION_DELTA

      # genes[gene] = 0.0 if genes[gene] < 0.0
      # genes[gene] = 1.0 if genes[gene] > 1.0
    end

    def play_round_against(opponent)
      move1 = move_against(opponent)
      move2 = opponent.move_against(self)

      round_score1, round_score2 = case [move1, move2]
      when [:coop, :coop] then [CC_SCORE, CC_SCORE]
      when [:coop, :defect] then [CD_SCORE, DC_SCORE]
      when [:defect, :coop] then [DC_SCORE, CD_SCORE]
      when [:defect, :defect] then [DD_SCORE, DD_SCORE]
      end

      self.score += round_score1
      opponent.score += round_score2
    end

    def to_s
      "[#{score}, {#{genes.join(', ')}}]"
    end

    def default_genes
      raise NoMethodError, 'Abstract method #default_genes undefined'
    end

    def move_against(opponent)
      raise NoMethodError, 'Abstract method #move_against undefined'
    end
  end
end
