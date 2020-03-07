class TicTacToe

attr_accessor :board

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_number = "#{input}".to_i - 1
    input_number
  end

  def move(index, token = "x")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] != "X" && @board[index] != "O"
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      true
    else
      false
    end
  end

  def turn_count
    turns = 0
    @board.each do |i|
      if i == "X" || i == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please input a number from 1-9 to place your token in the cooresponding square."
    user_turn = gets.strip.to_i
    index = input_to_index(user_turn)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "input invalid, please enter another number"
      sleep(2)
      turn
    end
  end

  def won?
     WIN_COMBINATIONS.any? do |combo|
       if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
         return combo
       end
     end
   end

  def full?
    !@board.any?{|i| i == " "}
  end

  def draw?
    !self.won? && self.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    self.turn while !self.over?
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end


end
