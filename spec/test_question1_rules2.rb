require 'minitest/autorun'
require '../lib/question1/break_password.rb'

class Question1Rules2 < Minitest::Test

  # Testing with example range
  def test_question1_with_rules_2_example_1
    breaking_password = BreakPassword.new(222222, 222251)
    assert_equal breaking_password.rules_2, 'There are 2 possible password combinations, according to rules 2.'
  end

  def test_question1_with_rules_2_example_2
    breaking_password = BreakPassword.new(555599, 555699)
    assert_equal breaking_password.rules_2, 'There are 7 possible password combinations, according to rules 2.'
  end

  def test_question1_with_rules_2_example_3
    breaking_password = BreakPassword.new(345577, 345679)
    assert_equal breaking_password.rules_2, 'There are 10 possible password combinations, according to rules 2.'
  end

  # Testing with example from docs
  def test_question1_with_rules_2_example_doc_1
    breaking_password = BreakPassword.new(334478, 334478)
    assert_equal breaking_password.rules_2, 'There are 1 possible password combinations, according to rules 2.'
  end

  def test_question1_with_rules_2_example_doc_2
    breaking_password = BreakPassword.new(347779, 347779)
    assert_equal breaking_password.rules_2, 'There are 0 possible password combinations, according to rules 2.'
  end

  def test_question1_with_rules_2_example_doc_3
    breaking_password = BreakPassword.new(444557, 444557)
    assert_equal breaking_password.rules_2, 'There are 1 possible password combinations, according to rules 2.'
  end

  # Testing with the real range
  def test_question1_with_rules_2_real_range
    breaking_password = BreakPassword.new(184759, 856920)
    assert_equal breaking_password.rules_2, 'There are 1148 possible password combinations, according to rules 2.'
  end
end
