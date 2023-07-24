##
# SOLUTION:
# The solution/response for the 'commands.txt' file that was provided is 670,
# So, the return of the main function is going to be: 'The address is: Cross Street, 670'

##
# SolveCase class
# This class represents the solving case process, implemented to get a solution/response
#  to the commands listed on the file 'commands.txt' provided.
class SolveCase

  ##
  # The default file location
  DEFAULT_COMMANDS_FILE_LOCATION = '../instructions/commands.txt'

  ##
  # The default response
  DEFAULT_RETURN = "The address is: Cross Street, address_number"

  ##
  # initialize function
  # This is the class' constructor
  #
  # It allows to inform a diferent file to execute the commands, which can be provided
  # during the instance of the class. The parameter is optional, so, if the default
  # file is the one necessary, it can be omitted.
  #
  # It also initializes some class' atributes, @command, @address_number and @skip_count.
  def initialize(file_location = nil)
    @commands = commands(file_location)
    @command = nil
    @address_number = 0
    @skip_count = 0
  end

  ##
  # solve_case function
  # Main function used to read and check the commands, and then solve the case.
  #
  # This function iterates through every command on the file provided.
  #
  # It checks if it is a command that must be skipped by a rule defined on the
  # previous iterations.
  #   - if not:
  #     - It checks if it must increment (command starting with 20). If it is true, it
  #       increments 1 to the address number.
  #     - it checks if it must be skipped (command stating with 5). If it is true, it
  #       defines the amount of command is going to be skipped on the next n commands.
  #       Nothing is incremented to the address number.
  #   - if yes:
  #     - It decrease the skip counter by 1 and nothing is incremented to the address number.
  #
  # Finally, it returns the solution/response with the complete address.
  def solve_case
    @commands.each do |command|
      @command = command
      unless skip?
        increase_address if must_increase?
        skip_commands if must_skip?
      else
        decrease_skip_count
      end
    end
    return_solution
  end

  private

  ##
  # commands function
  #
  # It expects the file_location parameter. It could be a string with the location
  # or even an empty string.
  #
  # This function define the file to be used, based on whether the parameter was
  # provided during the class instance or not.
  #
  # It returns an array with all the commands read from the file.
  def commands(file_location)
    if file_location.nil?
      File.read(DEFAULT_COMMANDS_FILE_LOCATION).split
    else
      File.read(file_location).split
    end
  end

  ##
  # skip function
  #
  # This function checks if the @skip_count attibute is higher than 0. skip count higher
  # than 0 means that there are commands to skip yet. Skip count equals to 0 means that
  # there are no more commands to skip on the next command.
  #
  # It returns a boolean value.
  def skip?
    @skip_count > 0
  end

  ##
  # must_increase?
  #
  # This function checks if the command is an increment command (command that starts with 20).
  #
  # It returns a boolean value.
  def must_increase?
    @command[0..1] == '20'
  end

  ##
  # must_skip?
  #
  # This function checks if the command is a skip command (command that starts with 5).
  #
  # It returns a boolean value.
  def must_skip?
    @command[0] == '5'
  end

  ##
  # increase_address function
  #
  # This function increments the address number based on the value to increase returned
  # from the function value_to_increase.
  def increase_address
    @address_number += value_to_increase
  end

  ##
  # skip_commands function
  #
  # This function defines the skip count based on the value returned from the
  # commands_to_skip function. If it is a single skip, that is, a command that is going
  # to skip only the current command, the function doesn't define anything.
  def skip_commands
    @skip_count = commands_to_skip unless single_skip?
  end

  ##
  # decrease_skip_count function
  #
  # This function decrease a number from the skip cout by one, used when a skip is performed.
  def decrease_skip_count
    @skip_count -= 1
  end

  ##
  # commands_to_skip function
  #
  # This function returns the number of commands that must be skip based on the current
  # command. Used when a command starts with 5, it captures the number following the 5
  # on the command to define how many commands it must skip.
  def commands_to_skip
    @command[1..@command.length].to_i - 1
  end

  ##
  # value_to_increase function
  #
  # This function returns the value to increase on the address number based on the
  # current command. Used when a command starts with 20, it captures the number following
  # the 20 on the command to define how much it must be incremented on the address number.
  def value_to_increase
    @command[2..@command.length].to_i
  end

  ##
  # single_skip? function
  #
  # This function checks if it is a single skip, that is, a command that is going to
  # skip only the current command.
  def single_skip?
    commands_to_skip.negative?
  end

  ##
  # return_solution function
  #
  # This functions returns the text of the solution with the address found.
  def return_solution
    DEFAULT_RETURN.sub 'address_number', @address_number.to_s
  end
end
