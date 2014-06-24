module IPDSimulation
  class Population
    attr_accessor :individuals

    def initialize(args = {})
      self.individuals = Array.new

      # Essentially clone given population
      unless args[:individuals].nil?
        args[:individuals].each do |i|
          self.individuals << i.class.new(genes: i.genes, score: i.score)
        end
      end

      unless args[:seed_with].nil?
        seed!(args[:seed_with])
      end
    end

    def play_games
      (0..individuals.length-2).each do |i|
        (i+1..individuals.length-1).each do |j|
          Game.new(individuals[i], individuals[j]).play_game
        end
      end
    end

    def mutate!
      individuals.sample(AFFECTED_BY_MUTATION * size).map!(&:mutate!)
    end

    def inspect
      %Q{
*** POPULATION *********
#{ individuals.join("\n") }
************************
      }
    end

    def size
      individuals.length
    end

    def fitness_values
      individuals.map(&:score)
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
      total_fitness.to_f / size.to_f
    end

    def select
      rand_individual = individuals.sample

      if rand <= propagation_prob(rand_individual)
        # rand_individual.score /= 2
        return rand_individual
      end
    end

    private

      def seed!(seed_class)
        POPULATION_SIZE.times { self.individuals << seed_class.new }
      end

      def propagation_prob(individual)
        (individual.score - min_fitness + 1).to_f / (max_fitness - min_fitness + 1)
      end
  end
end
