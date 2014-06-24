require_relative 'ipdsimulation/constants.rb'
require_relative 'ipdsimulation/chromosome.rb'
require_relative 'ipdsimulation/population.rb'

module IPDSimulation
  population = Population.new
  population.seed!

  1.upto(NUM_GENERATIONS).each do |generation|

    offspring = Population.new

    while offspring.count < POPULATION_SIZE
      parent1 = population.select
      parent2 = population.select

      if rand <= CROSSOVER_RATE
        child1, child2 = parent1 & parent2
      else
        child1 = parent1
        child2 = parent2
      end

      child1.mutate!
      child2.mutate!

      offspring.chromosomes << child1 << child2
    end

    if POPULATION_SIZE.odd?
      offspring.chromosomes.delete_at(rand(offspring.chromosomes.length))
    end

    puts "Generation #{generation} - Average: #{population.average_fitness.round(2)} - Max: #{population.max_fitness}"

    population = offspring
  end

  puts "Final population: " + population.inspect
end
