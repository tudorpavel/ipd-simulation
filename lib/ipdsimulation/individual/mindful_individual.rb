module IPDSimulation
  class MindfulIndividual < Individual
    attr_accessor :last_move, :nr_coop, :nr_defect

    def initialize(args = {})
      self.last_move = nil
      self.nr_coop = 0
      self.nr_defect = 0

      super(args)
    end

    def default_genes
      gs = []
      6.times { gs << rand }
      gs
    end

    def predominantly
      coop_prob = nr_coop.to_f / (nr_coop + nr_defect)

      case
      when coop_prob <= 0.35 then :defect
      when coop_prob >= 0.65 then :coop
      else :indiff
      end
    end

    def move_against(opponent)
      move =
        case [opponent.last_move, opponent.predominantly]
        when [:coop, :coop] then move_for(genes[0])
        when [:coop, :indiff] then move_for(genes[1])
        when [:coop, :defect] then move_for(genes[2])
        when [:defect, :coop] then move_for(genes[3])
        when [:defect, :indiff] then move_for(genes[4])
        when [:defect, :defect] then move_for(genes[5])
        else move_for(genes[0])
        end

      move == :coop ? self.nr_coop += 1 : self.nr_defect += 1
      self.last_move = move
    end

    private

      def move_for(gene)
        rand <= gene ? :coop : :defect
      end
  end
end
