module SuSolver
  def self.solve(sudoku)
    grid = SuSolver::Grid.new sudoku
    SuSolver::Solver.solve grid
    grid.to_s
  end
end

require 'su_solver/grid'
require 'su_solver/solver'
