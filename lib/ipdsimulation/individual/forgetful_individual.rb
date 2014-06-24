module IPDSimulation
  class ForgetfulIndividual < Individual
    def initialize(args = {})
      self.genes = args[:genes] || [rand]
      self.score = args[:score] || 0
    end

    def move_against(opponent)
      rand <= genes.first ? :coop : :defect
    end
  end
end
