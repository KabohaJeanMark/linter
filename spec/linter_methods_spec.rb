require 'linter_methods'

describe LinterCheck do
  describe '#initialize' do
    context 'when wrong number of args are passed' do
      it 'raises Argument error if no arg is passed' do
        expect {LinterCheck.new}.to raise_error(ArgumentError)
      end

      
    end
  end
end

