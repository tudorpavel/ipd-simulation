require_relative 'ipdsimulation/constants'
require_relative 'ipdsimulation/chromosome'
require_relative 'ipdsimulation/population'
require_relative 'ipdsimulation/game'

module IPDSimulation
  population = Population.new
  population.seed!

  max_average = population
  max_max = population

  1.upto(NUM_GENERATIONS).each do |generation|

    population.play_games

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
    # puts "Current population: " + population.inspect
    max_average = Population.new(population.chromosomes) if population.average_fitness > max_average.average_fitness
    max_max = Population.new(population.chromosomes) if population.max_fitness > max_max.max_fitness

    population = offspring
  end

  puts "Final population: " + population.inspect
  puts "Average: #{max_average.average_fitness.round(2)} - Max: #{max_average.max_fitness}"
  puts "Max Average population: " + max_average.inspect
  puts "Average: #{max_max.average_fitness.round(2)} - Max: #{max_max.max_fitness}"
  puts "Max Max population: " + max_max.inspect
end
