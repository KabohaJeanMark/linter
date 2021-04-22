require 'colorize'

class LinterCheck
  attr_reader :error_list

  def initialize(file_route)
    @error_list = []
    @file_route = file_route
  end

  def check_methods
    num = 0
    File.readlines(@file_route).each do |line|
      num += 1
      single_quote(line, num)
      double_quote(line, num)
      important(line, num)
    end
    @error_list
  end

  def single_quote(line, num)
    @error_list.push("Single quotes on line number #{num}".colorize(:light_red)) if line.include?("'")
  end

  def double_quote(line, num)
    @error_list.push("Double quotes on line number #{num}".colorize(:light_red)) if line.include?('"')
  end

  def important(line, num)
    @error_list.push("!important. Please remove from line #{num}".colorize(:light_red)) if line.include?('!important')
  end
end
