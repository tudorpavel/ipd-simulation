module IPDSimulation
  # Individual type
  types = [ForgetfulIndividual]
  INDIVIDUAL_TYPE = types[0]

  # Simulation
  POPULATION_SIZE = 20
  NUM_GENERATIONS = 1000

  # Mutation
  AFFECTED_BY_MUTATION = 0.2
  MUTATION_DELTA = 0.2

  # Game
  NR_ROUNDS = 10

  # Payoff MATRIX
  CC_SCORE = 4
  CD_SCORE = 0
  DC_SCORE = 6
  DD_SCORE = 2
end
