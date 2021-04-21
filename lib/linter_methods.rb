require 'colorize'

class LinterCheck
  def initialize(file_route)
    @error_list = []
    @file_route = file_route
  end

  def check_methods
    single_quote
  end

  def single_quote(line, num)
    if line.include?("'")
      @error_list.shift("Single quotes on line number #{num}".colorize(:light_red))
    end
  end
end