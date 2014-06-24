module IPDSimulation
  # Individual type
  types = [ForgetfulIndividual]
  INDIVIDUAL_TYPE = types[0]

  # Simulation
  POPULATION_SIZE = 5
  NUM_GENERATIONS = 10

  # Mutation
  AFFECTED_BY_MUTATION = 0.1
  MUTATION_DELTA = 0.2

  # Game
  NR_ROUNDS = 10

  # Payoff MATRIX
  CC_SCORE = 4
  CD_SCORE = 0
  DC_SCORE = 6
  DD_SCORE = 2
end
