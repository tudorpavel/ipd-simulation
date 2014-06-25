require_relative 'ipdsimulation/individual/individual'
require_relative 'ipdsimulation/individual/forgetful_individual'
require_relative 'ipdsimulation/individual/reactive_individual'
require_relative 'ipdsimulation/individual/mindful_individual'
require_relative 'ipdsimulation/constants'
require_relative 'ipdsimulation/game'
require_relative 'ipdsimulation/population'

module IPDSimulation
  population = Population.new(seed_with: INDIVIDUAL_TYPE)

  max_average = Population.new(seed_with: INDIVIDUAL_TYPE)
  max_max = Population.new(seed_with: INDIVIDUAL_TYPE)

  1.upto(NUM_GENERATIONS).each do |generation|
    population.play_games

    puts "Generation #{generation} - Average: #{population.average_fitness.round(2)} - Max: #{population.max_fitness}, Average strategy: #{population.average_strategy}"
    # puts "Current population: " + population.inspect

    max_average = Population.new(individuals: population.individuals) if population.average_fitness > max_average.average_fitness
    max_max = Population.new(individuals: population.individuals) if population.max_fitness > max_max.max_fitness

    offspring = Population.new

    while offspring.size < POPULATION_SIZE
      individual = population.select

      unless individual.nil?
        offspring.individuals << INDIVIDUAL_TYPE.new(genes: individual.genes)
      end
    end

    offspring.mutate!


    population = offspring
  end

  # puts "Final population: " + population.inspect
  puts "Max Average: #{max_average.average_fitness.round(2)} - Max: #{max_average.max_fitness}, Average strategy: #{max_average.average_strategy}"
  # puts max_average.inspect
  puts "Max Max: #{max_max.average_fitness.round(2)} - Max: #{max_max.max_fitness}, Average strategy: #{max_max.average_strategy}"
  # puts max_max.inspect
end
