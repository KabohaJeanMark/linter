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
      extra_colons(line, num)
      z_index(line, num)
      id_selector(line, num)
    end
    @error_list
  end

  def single_quote(line, num)
    @error_list.push("Single quotes on line #{num}".colorize(:light_red)) if line.include?("'")
  end

  def double_quote(line, num)
    @error_list.push("Double quotes on line #{num}".colorize(:light_red)) if line.include?('"')
  end

  def important(line, num)
    @error_list.push("!important. Please remove from line #{num}".colorize(:light_red)) if line.include?('!important')
  end

  def extra_colons(line, num)
    @error_list.push("Extra semi colon on line #{num}".colorize(:light_red)) if line.include?(';;')
  end

  def z_index(line, num)
    return unless line.include?('z-index') && !line.match((/\d/i))

    @error_list.push("z-index should be a number on line #{num}".colorize(:light_red))
  end

  def id_selector(line, num)
    return unless line.include?('#')

    @error_list.push("Class selectors are preferred to id selectors on line #{num}".colorize(:light_red))
  end
end
