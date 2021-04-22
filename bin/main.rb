require_relative '../lib/linter_methods'

linter_example = LinterCheck.new('css/style.css')
puts linter_example.check_methods

puts "Enter 'csslint' to test another file without errors and see it displayed"

user_input = gets.chomp.downcase

if user_input == 'csslint'
  linter_example_b = LinterCheck.new('css/style2.css')
  puts linter_example_b.check_methods
end

puts "Enter 'read' to view a file with no errors"
user_input_b = gets.chomp.downcase

if user_input_b == 'read'
  puts '--------*--------'
  puts 'Example file with no errors'
  puts '--------*--------'
  puts File.read('css/style2.css')
end
