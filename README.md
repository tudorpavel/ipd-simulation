IPDSimulation
==============

This application is a Genetic Simulation which can be used to experiment with evolving probabilistically defined strategies for the game of Iterated Prisoner's Dilemma (IPD).

It uses three types of strategies:
- Type 1 (no memory) is defined in the `ForgetfulIndividual` class
- Type 2 (short-term memory) is defined in the `ReactiveIndividual` class
- Type 3 (long-term memory) is defined in the `MindfulIndividual` class

## Requirements

- Ruby >= 2.1.2
- A good understanding of:
  - IPD
  - Strategies for IPD (such as TIT FOR TAT)
  - Genetic Algorithms

## Usage

The parameters for running the simulation can be found in the `/lib/ipdsimulation/constants.rb` file. Once the values have been set, the simulation can be started by executing the following command inside the `/lib` folder:

`ruby ipdsimulation.rb`

Output messages will be printed as the simulation runs.

## Credits

- This application is based on Matt Mazur's [A Simple Genetic Algorithm Written in Ruby](http://mattmazur.com/2013/08/18/a-simple-genetic-algorithm-written-in-ruby/)

## License

IPDSimulation is available under the MIT License. See the [LICENSE](./LICENSE) file for more info.
