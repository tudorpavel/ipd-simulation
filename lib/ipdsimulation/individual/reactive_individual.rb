module IPDSimulation
  class ReactiveIndividual < Individual
    attr_accessor :last_move

    def initialize(args = {})
      self.last_move = nil

      super(args)
    end

    def default_genes
      [rand, rand]
    end

    def move_against(opponent)
      self.last_move =
        if opponent.last_move == :coop
          rand <= genes.first ? :coop : :defect
        else
          rand <= genes.last ? :coop : :defect
        end
    end
  end
end
