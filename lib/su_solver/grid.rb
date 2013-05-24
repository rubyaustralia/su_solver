class SuSolver::Grid
  VALUES = %w( 1 2 3 4 5 6 7 8 9 )

  def initialize(string)
    @string = string
  end

  def rows
    @string.scan(/\d{9}/)
  end

  def columns
    @string.scan(/\d{9}/).collect { |row| row.scan(/\d/) }.transpose.collect &:join
  end

  def get_grid_value(row, column)
    @string[column + (row * 9)]
  end

  def set_grid_value(row, column, value)
    @string[column + (row * 9)] = value
  end

  def valid?
    rows.each do |row|
      return false unless row.split(/./).uniq.count == 9
    end
    columns.each do |column|
      return false unless column.split(/./).uniq.count == 9
    end
    groups.each do |group|
      return false unless group.split(/./).uniq.count == 9
    end
  end

  def solved?
    @string['0'].nil?
  end

  def missing_values(set)
    VALUES - set.scan(/./)
  end

  def available_values(row, column)
    missing_values(rows[row]) &
    missing_values(columns[column]) &
    missing_values(group_for(row, column))
  end

  def groups
    @string.scan(/\d\d\d/).each_slice(9).collect do |block|
      gr = Array.new(3, '')
      block.each_with_index do |item, index|
        gr[index % 3] += item
      end
      gr
    end.flatten
  end

  def to_s
    @string
  end

  private

  def group_for(row, column)
    groups[(column / 3) + ((row / 3) * 3)]
  end
end
