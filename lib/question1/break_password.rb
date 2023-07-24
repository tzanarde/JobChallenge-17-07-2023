##
# SOLUTION:
# The solutions/responses for the password breaking with the range from
# 184759 to 856920 are:
#   - Using rules number 1: 1687 possible password combinations.
#     - So, the return of the rules_1 function is going to be:
#       'There are 1687 possible password combinations, according to rules 1.'
#   - Using rules number 2: 1148 possible password combinations.
#     - So, the return of the rules_2 function is going to be:
#       'There are 1148 possible password combinations, according to rules 2.'

# The default minimum password provided
DEFAULT_MIN_PASSWORD = 184759

# The default maximum password provided
DEFAULT_MAX_PASSWORD = 856920

# The default response
DEFAULT_RETURN = "There are _comb possible password combinations, according to rules _rule."

##
# BreakPassword class
# This class represents the breaking password process, implemented to get a
# solution/response to both rules 1 and 2.
class BreakPassword

  ##
  # initialize function
  # This is the class' constructor
  #
  # It expects the minimum and maximum password of the range, which must be provided
  # during the instance of the class.
  def initialize(min_password, max_password)
    @min_password = min_password if value_provided?(min_password)
    @max_password = max_password if value_provided?(max_password)
  end

  ##
  # rules_1 function
  # Main function for the rules number 1.
  #
  # It calls the private function 'find_by_rules' and define the number of
  # the rule that must be used, rules number 1 in this case.
  def rules_1
    @rules = 1
    find_by_rules
  end

  ##
  # rules_2 function
  # Main function for the rules number 2
  #
  # It calls the private function 'find_by_rules' and define the number of
  # the rule that must be used, rules number 2 in this case.
  def rules_2
    @rules = 2
    find_by_rules
  end

  private

  ##
  # find_by_rules function
  # Main function used by both rules number 1 and 2
  #
  # This function iterates from the minimum to the maximum password provided during
  # the class instance.
  #
  # It provides values to the class' atributes, related to the current password variable:
  #   - @current_password to control the password that is being checked at the moment
  #
  # It checks which rules are being applied, rules number 1 or rules number 2 by the
  # checking functions valid_rules_1? and valid_rules_2?
  #
  # Finally, it returns the solution/response with the possible password combinations by
  # the rules that was checked.
  def find_by_rules
    reset_possible_passwords
    @min_password.upto @max_password do |password|
      @current_password = password.to_s
      add_possible_passwords if valid_rules_1? or valid_rules_2?
    end
    return_solution
  end

  ##
  # valid_rules_1? function
  #
  # This function checks if the rules number 1 are being used, if it has a double digit
  # group and if there is no decreasing from left to right.
  def valid_rules_1?
    @rules == 1 and double_digits? and no_decreasing?
  end

  ##
  # valid_rules_1? function
  #
  # This function checks if the rules number 2 are being used, if it has a exactly double
  # digit group and if there is no decreasing from left to right.
  def valid_rules_2?
    @rules == 2 and exactly_double_digits? and no_decreasing?
  end

  ##
  # double_digits? function
  # This function checks whether a password is composed at least by one double digit group or not.
  #
  # At the first appearence of a double digit group, it immediately stops and returns true.
  # Otherwise, if no double digit group is found, it just returns false.
  #
  # This function is only used by rules number 1.
  def double_digits?
    0.upto 9 do |digit|
      return true if include_digit_twice?(digit)
    end
    false
  end

  ##
  # exactly_double_digits? function
  # This function checks whether a password is composed at least by one exactly double
  # digit group or not.
  #
  # It iterates through all the digits of a password, to guarantee that at least one exactly
  # double digit group exists. This way, it is possible to find the exactly double digit groups,
  # eliminating the "false double digit groups", that have more adjacent digits.
  #
  # This function splits the current password to an array of groups, where is possible to check
  # the groups of digits the password have.
  #   For example:
  #     The password 444557 is splitted in an array like this: [3, 2, 1]
  #     The first group of three '4' digits, a second of two '5' digits and the third group
  #     of one digit '7'.
  #
  # Finally, it checks if the array has a group of 2 and it returns whether the password has
  # at least one exactly double digit group or not.
  #
  # This function returns a boolean value.
  #
  # This function is only used by rules number 2.
  def exactly_double_digits?
    @groups = []
    last_digit = nil
    @current_password.split('').each do |current_digit|
      if current_digit == last_digit
        increment_group
      else
        new_group
      end
      last_digit = current_digit
    end
    @groups.include? 2
  end

  ##
  # no_decreasing? function
  # This function checks if there are no decreasing on the digits, from left to right.
  #
  # It compares the current digit with the highest digit found yet. Once a decrease is found,
  # it immediately stops the iteration and returns false. Otherwise, the function keeps going
  # until it returns true.
  #
  # This function returns a boolean value.
  #
  # This function is used by both rules number 1 and 2.
  def no_decreasing?
    highest_digit = 0
    @current_password.split('').each do |digit|
      return false unless digit.to_i >= highest_digit
      highest_digit = digit.to_i
    end
    true
  end

  ##
  # include_digit_twice? function
  #
  # It expects the following parameter:
  #   digit => The current digit of the checking process.
  #
  # It is used as an auxiliary function to the double_digits? function, to check if the
  # current password includes the digit twice.
  #
  # This function returns a boolean value.
  def include_digit_twice?(digit)
    @current_password.include? digit.to_s * 2
  end

  ##
  # add_possible_passwords function
  #
  # This function is used as an auxiliary function to both rules number 1 and 2, and
  # it increments the @possible_passwords attribute by 1.
  def add_possible_passwords
    @possible_passwords += 1
  end

  ##
  # increment_group function
  #
  # This function is used as an auxiliary function to the exactly_double_digits? function,
  # and it increments a value in last position of the @groups attribute array by 1.
  def increment_group
    @groups[-1] += 1
  end

  ##
  # new_group function
  #
  # This function is used as an auxiliary function to the exactly_double_digits? function,
  # and it creates a new group in the @groups attribute array.
  def new_group
    @groups.push 1
  end

  ##
  # reset_possible_passwords function
  #
  # This functions reset the possible passwords found, to avoid to accumulate from another
  # call of the functions on the same instance.
  def reset_possible_passwords
    @possible_passwords = 0
  end

  ##
  # return_solution function
  #
  # This functions returns the text of the solution with the quantity of possible passwords
  # found for a determinated rule.
  def return_solution
    DEFAULT_RETURN.sub('_comb', @possible_passwords.to_s).sub('_rule', @rules.to_s)
  end

  ##
  # value_provided function
  #
  # It expects the following parameter:
  #   value => The value provided, it can be the minimum or the maximum password.
  #
  # This function checks if the value was provided correctly and returns true, otherwise
  # it raises an exception.
  #
  def value_provided?(value)
      return true if not value.nil? and value > 0
      raise Exception.new "A value was not provided."
  end

end
