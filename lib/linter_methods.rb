def single_quote(line, num)
  if line.include?("'")
    @error_list << "Single quotes on line number #{num}"
  end
end