require 'linter_methods'

describe LinterCheck do
  let(:linter_check_object) { LinterCheck.new('css/style.css') }
  describe '#initialize' do
    context 'when the object is not created successfully' do
      it 'raises Argument error if no arg is passed' do
        expect { LinterCheck.new }.to raise_error(ArgumentError)
      end
      it 'raises argument error when more than one arg is passed' do
        expect { LinterCheck.new('../css/style', '2ndarg') }.to raise_error(ArgumentError)
      end
    end
    context 'when the object is created successfully' do
      it 'contains an empty array to store error messages' do
        expect(linter_check_object.error_list).to be_a(Array)
      end
    end
  end

  describe '#single_quote' do
    it 'checks if the single_quote method returns an array with the error message' do
      expect(linter_check_object.send(:single_quote, "'", 3)).to be_a(Array)
    end
    it 'checks if the error message is Single quotes on line number in color light-red' do
      expect(linter_check_object.send(:single_quote, "'",
                                      3)).to eql(['Single quotes on line number 3'.colorize(:light_red)])
    end
  end

  describe '#double_quote' do
    it 'checks that double_quote check returns an array with error' do
      expect(linter_check_object.send(:double_quote, '"', 7)).to be_a(Array)
    end
    it 'checks if the error message is double quotes on line number in color light-red' do
      expect(linter_check_object.send(:double_quote, '"',
                                      7)).to eql(['Double quotes on line number 7'.colorize(:light_red)])
    end
  end

  describe '#important' do
    it 'checks that error message tells to remove important from line number and is light_red' do
      expect(linter_check_object.send(:important, '!important',
                                      11)).to eql(['!important. Please remove from line 11'.colorize(:light_red)])
    end
  end
end
