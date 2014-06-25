module IPDSimulation
  class ForgetfulIndividual < Individual
    def default_genes
      [rand]
    end

    def move_against(opponent)
      rand <= genes.first ? :coop : :defect
    end
  end
end
