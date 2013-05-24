class SuSolver::Solver
  def self.solve(grid)
    until grid.solved?
      (0..8).each do |row|
        (0..8).each do |column|
          next unless grid.get_grid_value(row, column) == '0'

          values = grid.available_values(row, column)
          if values.length == 1
            grid.set_grid_value(row, column, values.first)
          end
        end
      end

      puts "--> #{grid.to_s}"
    end
  end
end
