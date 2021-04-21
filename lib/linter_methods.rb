

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
      @error_list << "Single quotes on line number #{num}"
    end
  end
end