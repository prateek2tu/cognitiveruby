# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def valid_entry?(board, row, col, entry, row_set, col_set, grid_set)
  return false if row_set[row].member?(entry)
  return false if col_set[col].member?(entry)
  grid_idx = get_grid row, col
  return false if grid_set[grid_idx].member?(entry)
  true
end

def add_entry(board, row, col, entry, row_set, col_set, grid_set)
  row_set[row].add entry
  col_set[col].add entry
  grid_idx = get_grid row, col
  grid_set[grid_idx].add entry
  board[row][col] = entry
end


def get_grid(row, col)
  return 0 if (row < 3) && (col < 3)
  return 1 if (row < 3) && (col < 6)
  return 2 if (row < 3)

  return 3 if (row < 6) && (col < 3)
  return 4 if (row < 6) && (col < 6)
  return 5 if (row < 6)

  return 6 if (col < 3)
  return 7 if (col < 6)
  8
end

def remove_entry(board, row, col, row_set, col_set, grid_set)
  entry = board[row][col]

  row_set[row].delete entry
  col_set[col].delete entry
  grid_idx = get_grid row, col
  grid_set[grid_idx].delete entry
  board[row][col] = "."
end

def filled?(board)
  (0..8).each do |row|
    (0..8).each do |col|
      return false if board[row][col] == "."
    end
  end
  true
end

def find_next_slot(board, row_set, col_set)
  (0..8).each do |row|
    next unless row_set[row].size < 9
    (0..8).each do |col|
      next unless col_set[col].size < 9
      return [row, col] if board[row][col] == "."
    end
  end
  nil
end

def sol_helper(board, row_set, col_set, grid_set)
  return true if filled?(board)
  row, col = find_next_slot board, row_set, col_set
  (1..9).map(&:to_s).each do |num|
    next unless valid_entry? board, row, col, num, row_set, col_set, grid_set
    add_entry board, row, col, num, row_set, col_set, grid_set
    return true if sol_helper board, row_set, col_set, grid_set
    remove_entry board, row, col, row_set, col_set, grid_set
  end
  false
end

def populate_sets(board, row_set, col_set, grid_set)
  (0..8).each do |row|
    (0..8).each do |col|
      next if board[row][col] == "."

      nn = board[row][col]
      row_set[row].add nn
      col_set[col].add nn
      grid_idx = get_grid row, col
      grid_set[grid_idx].add nn
    end
  end
end

def solve_sudoku(board)
  row_set = (0..8).map { |_| Set.new }
  col_set = (0..8).map { |_| Set.new }
  grid_set = (0..8).map { |_| Set.new }

  populate_sets board, row_set, col_set, grid_set

  sol_helper board, row_set, col_set, grid_set
end# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def valid_entry?(board, row, col, entry, row_set, col_set, grid_set)
  return false if row_set[row].member?(entry)
  return false if col_set[col].member?(entry)
  grid_idx = get_grid row, col
  return false if grid_set[grid_idx].member?(entry)
  true
end

def add_entry(board, row, col, entry, row_set, col_set, grid_set)
  row_set[row].add entry
  col_set[col].add entry
  grid_idx = get_grid row, col
  grid_set[grid_idx].add entry
  board[row][col] = entry
end


def get_grid(row, col)
  return 0 if (row < 3) && (col < 3)
  return 1 if (row < 3) && (col < 6)
  return 2 if (row < 3)

  return 3 if (row < 6) && (col < 3)
  return 4 if (row < 6) && (col < 6)
  return 5 if (row < 6)

  return 6 if (col < 3)
  return 7 if (col < 6)
  8
end

def remove_entry(board, row, col, row_set, col_set, grid_set)
  entry = board[row][col]

  row_set[row].delete entry
  col_set[col].delete entry
  grid_idx = get_grid row, col
  grid_set[grid_idx].delete entry
  board[row][col] = "."
end

def filled?(board)
  (0..8).each do |row|
    (0..8).each do |col|
      return false if board[row][col] == "."
    end
  end
  true
end

def find_next_slot(board, row_set, col_set)
  (0..8).each do |row|
    next unless row_set[row].size < 9
    (0..8).each do |col|
      next unless col_set[col].size < 9
      return [row, col] if board[row][col] == "."
    end
  end
  nil
end

def sol_helper(board, row_set, col_set, grid_set)
  return true if filled?(board)
  row, col = find_next_slot board, row_set, col_set
  (1..9).map(&:to_s).each do |num|
    next unless valid_entry? board, row, col, num, row_set, col_set, grid_set
    add_entry board, row, col, num, row_set, col_set, grid_set
    return true if sol_helper board, row_set, col_set, grid_set
    remove_entry board, row, col, row_set, col_set, grid_set
  end
  false
end

def populate_sets(board, row_set, col_set, grid_set)
  (0..8).each do |row|
    (0..8).each do |col|
      next if board[row][col] == "."

      nn = board[row][col]
      row_set[row].add nn
      col_set[col].add nn
      grid_idx = get_grid row, col
      grid_set[grid_idx].add nn
    end
  end
end

def solve_sudoku(board)
  row_set = (0..8).map { |_| Set.new }
  col_set = (0..8).map { |_| Set.new }
  grid_set = (0..8).map { |_| Set.new }

  populate_sets board, row_set, col_set, grid_set

  sol_helper board, row_set, col_set, grid_set
end
