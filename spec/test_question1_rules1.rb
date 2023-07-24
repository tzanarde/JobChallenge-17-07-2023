require 'minitest/autorun'
require '../lib/question1/break_password.rb'

class Question1Rules1 < Minitest::Test

  # Testing with example range
  def test_question1_with_rules_1_example_1
    breaking_password = BreakPassword.new(222222, 222251)
    assert_equal breaking_password.rules_1, 'There are 21 possible password combinations, according to rules 1.'
  end

  def test_question1_with_rules_1_example_2
    breaking_password = BreakPassword.new(555599, 555699)
    assert_equal breaking_password.rules_1, 'There are 11 possible password combinations, according to rules 1.'
  end

  def test_question1_with_rules_1_example_3
    breaking_password = BreakPassword.new(345577, 345679)
    assert_equal breaking_password.rules_1, 'There are 11 possible password combinations, according to rules 1.'
  end

  # Testing with example from docs
  def test_question1_with_rules_1_example_doc_1
    breaking_password = BreakPassword.new(222222, 222222)
    assert_equal breaking_password.rules_1, 'There are 1 possible password combinations, according to rules 1.'
  end

  def test_question1_with_rules_1_example_doc_2
    breaking_password = BreakPassword.new(236775, 236775)
    assert_equal breaking_password.rules_1, 'There are 0 possible password combinations, according to rules 1.'
  end

  def test_question1_with_rules_1_example_doc_3
    breaking_password = BreakPassword.new(345789, 345789)
    assert_equal breaking_password.rules_1, 'There are 0 possible password combinations, according to rules 1.'
  end

  # Testing exceptions
  def test_question1_with_error_minimum_number_nil
    assert_raises Exception, "A number was not provided." do
      BreakPassword.new(nil, 856920)
    end
  end

  def test_question1_with_error_maximum_number_nil
    assert_raises Exception, "A number was not provided." do
      BreakPassword.new(184759, nil)
    end
  end

  # Testing with the real range
  def test_question1_with_rules_1_real_range
    breaking_password = BreakPassword.new(184759, 856920)
    assert_equal breaking_password.rules_1, 'There are 1687 possible password combinations, according to rules 1.'
  end
end
