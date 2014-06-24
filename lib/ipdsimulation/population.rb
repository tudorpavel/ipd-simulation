require_relative 'game'

module IPDSimulation
  class Population
    attr_accessor :chromosomes

    def initialize(chromos = nil)
      self.chromosomes = Array.new

      unless chromos.nil?
        chromos.each { |c| self.chromosomes << Chromosome.new(c.genes, c.score) }
      end
    end

    def play_games
      # Reset scores
      chromosomes.each { |c| c.score = 0 }

      (0..chromosomes.length-2).each do |i|
        (i+1..chromosomes.length-1).each do |j|
          Game.new(chromosomes[i], chromosomes[j]).play_game
        end
      end
    end

    def inspect
      chromosomes.join(" ")
    end

    def seed!
      chromosomes = Array.new
      1.upto(POPULATION_SIZE).each do
        chromosomes << Chromosome.new
      end

      self.chromosomes = chromosomes
    end

    def count
      chromosomes.count
    end

    def fitness_values
      chromosomes.collect(&:fitness)
    end

    def total_fitness
      fitness_values.reduce(:+)
    end

    def min_fitness
      fitness_values.min
    end

    def max_fitness
      fitness_values.max
    end

    def average_fitness
      total_fitness.to_f / chromosomes.length.to_f
    end

    def propagation_prob(fitness)
      (fitness + 1 - min_fitness).to_f / (max_fitness + 1 - min_fitness)
    end

    def select
      while true do
        rand_chromosome = chromosomes[rand(count)]

        if rand <= propagation_prob(rand_chromosome.fitness)
          return rand_chromosome
        end
      end
    end
  end
end
