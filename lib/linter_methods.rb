require 'colorize'

class LinterCheck
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
      z_index_size(line, num)
      id_selector(line, num)
      pixels(line, num)
      commented_code(line, num)
      color_rules(line, num)
      space_at_line_end(line, num)
    end
    if @error_list.length.zero?
      'All checks have passed. No linter errors'.colorize(:green)
    else
      @error_list
    end
  end

  private

  def important(line, num)
    @error_list.push("!important. Please remove from line #{num}".colorize(:light_red)) if line.include?('!important')
  end

  def single_quote(line, num)
    @error_list.push("Single quotes at end of line #{num}".colorize(:light_red)) if line.include?("'")
  end

  def double_quote(line, num)
    @error_list.push("Double quotes at end of line #{num}".colorize(:light_red)) if line.include?('"')
  end

  def extra_colons(line, num)
    @error_list.push("Extra semi colon on line #{num}".colorize(:light_red)) if line.include?(';;')
  end

  def z_index(line, num)
    return unless line.include?('z-index') && !line.match((/\d/i))

    @error_list.push("z-index should be a number on line #{num}".colorize(:light_red))
  end

  def z_index_size(line, num)
    return unless line.include?('z-index') && line.split(':')[1].to_i > 100

    @error_list.push("z-index is too big on line #{num}".colorize(:yellow))
  end

  def id_selector(line, num)
    return unless line.include?('#') && !line.include?('{')

    @error_list.push("Class selector preferred to id on line #{num}".colorize(:yellow))
  end

  def pixels(line, num)
    return unless line.include?('px')

    @error_list.push("Used px. Prefer fluid measurements on line #{num}".colorize(:yellow))
  end

  def commented_code(line, num)
    @error_list.push("Comments detected. Remove /* from line #{num}".colorize(:light_red)) if line.include?('/*')
  end

  def color_rules(line, num)
    return unless line.include?('color') && !line.split(':')[1].include?('rgb' || '#')

    @error_list.push("Used color name. Please use hex or rgb values on line #{num}".colorize(:yellow))
  end

  def space_at_line_end(line, num)
    bare_line = line.delete("\n")
    return unless bare_line.end_with?(' ')

    @error_list.push("Empty space detected at end of line #{num}".colorize(:light_red))
  end
end
