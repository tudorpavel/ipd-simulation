module IPDSimulation
  # Individual type
  types = [ForgetfulIndividual, ReactiveIndividual]
  INDIVIDUAL_TYPE = types[1]

  # Simulation
  POPULATION_SIZE = 25
  NUM_GENERATIONS = 1000

  # Mutation
  AFFECTED_BY_MUTATION = 0.1
  MUTATION_DELTA = 0.2

  # Game
  NR_ROUNDS = 20

  # Payoff MATRIX
  CC_SCORE = 4
  CD_SCORE = 0
  DC_SCORE = 6
  DD_SCORE = 2
end
