require_relative '../lib/linter_methods'

linter_example = LinterCheck.new('css/style.css')
puts linter_example.check_methods
