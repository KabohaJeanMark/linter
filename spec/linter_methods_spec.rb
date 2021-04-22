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

  describe '#important' do
    it 'checks that error message tells to remove important from line and is light_red' do
      expect(linter_check_object.send(:important, '!important',
                                      11)).to eql(['!important. Please remove from line 11'.colorize(:light_red)])
    end
    it 'checks important method does not return empty' do
      expect(linter_check_object.send(:important, '!important',
                                      11)).not_to be false
    end
  end

  describe '#single_quote' do
    it 'checks if the single_quote method returns an array with the error message' do
      expect(linter_check_object.send(:single_quote, "'", 3)).to be_a(Array)
    end
    it 'checks if the error message is Single quotes on line in color light-red' do
      expect(linter_check_object.send(:single_quote, "'",
                                      3)).to eql(['Single quotes at end of line 3'.colorize(:light_red)])
    end
  end

  describe '#double_quote' do
    it 'checks that double_quote check returns an array with error' do
      expect(linter_check_object.send(:double_quote, '"', 7)).to be_a(Array)
    end
    it 'checks if the error message is double quotes on line in color light-red' do
      expect(linter_check_object.send(:double_quote, '"',
                                      7)).to eql(['Double quotes at end of line 7'.colorize(:light_red)])
    end
  end

  describe '#extra_colons' do
    it 'checks if the extra_colons method returns an array with the error message' do
      expect(linter_check_object.send(:extra_colons, ';;', 11)).to be_a(Array)
    end
    it 'checks if the error message is Extra semi colon on line in color light-red' do
      expect(linter_check_object.send(:extra_colons, ';;',
                                      11)).to eql(['Extra semi colon on line 11'.colorize(:light_red)])
    end
  end

  describe '#z_index' do
    it 'checks that z-index should be a number error message stored in array' do
      expect(linter_check_object.send(:z_index, 'z-index', 12)).to be_a(Array)
    end

    it 'checks that z_index method raises argument error if only passed one argument' do
      expect { linter_check_object.send(:z_index, 'z-index') }.to raise_error(ArgumentError)
    end
  end

  describe '#id_selector' do
    it 'checks that warning in color yellow adising class-selector is preferred to id selector on line' do
      expect(linter_check_object.send(:id_selector, '#',
                                      15)).to eql(['Class selector preferred to id on line 15'.colorize(:yellow)])
    end
    it 'checks that id selector when passed id does not return false' do
      expect(linter_check_object.send(:id_selector, '#', 15)).not_to be false
    end
  end

  describe '#z_index_size' do
    it 'checks that warning in yellow is issued when z index value is too big' do
      expect(linter_check_object.send(:z_index_size, 'z-index: 999',
                                      20)).to eql(['z-index should is too big on line 20'.colorize(:yellow)])
    end
  end

  describe '#pixels' do
    it 'checks if the error message shows px used on line in light-red' do
      expect(linter_check_object.send(:pixels, 'px',
                                      11)).to eql(['Used px. Prefer fluid measurements on line 11'.colorize(:yellow)])
    end
  end

  describe '#commented_code' do
    it 'checks if the error message shows px used on line in light-red' do
      expect(linter_check_object.send(:commented_code, '/*',
                                      21)).to eql(['Comments detected. Remove /* from line 21'.colorize(:light_red)])
    end
  end
end
