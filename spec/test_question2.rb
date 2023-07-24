require 'minitest/autorun'
require '../lib/question2/solve_case.rb'

class Question2 < Minitest::Test

  # Testing with example commands
  def test_question2_example
    solving_case = SolveCase.new('../instructions/commands_example.txt')
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 3'
  end
  def test_question2_only_increase
    solving_case = SolveCase.new('../instructions/commands_only_increase.txt')
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 45'
  end
  def test_question2_increase_with_double_digit
    solving_case = SolveCase.new('../instructions/commands_double_digit.txt')
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 165'
  end
  def test_question2_no_increases
    solving_case = SolveCase.new('../instructions/commands_no_increases.txt')
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 0'
  end
  def test_question2_with_skip_zero
    solving_case = SolveCase.new('../instructions/commands_with_skip_zero.txt')
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 7'
  end

  # Testing with real commands
  def test_question2_real_commands
    solving_case = SolveCase.new
    assert_equal solving_case.solve_case, 'The address is: Cross Street, 670'
  end
end
