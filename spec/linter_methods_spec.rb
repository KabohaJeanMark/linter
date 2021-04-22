require 'linter_methods'

describe LinterCheck do
  let(:linter_check_object) {LinterCheck.new('css/style.css')}
  describe '#initialize' do
    context 'when the object is not created successfully' do
      it 'raises Argument error if no arg is passed' do
        expect {LinterCheck.new}.to raise_error(ArgumentError)
      end
      it 'raises argument error when more than one arg is passed' do
        expect {LinterCheck.new('../css/style', '2ndarg')}.to raise_error(ArgumentError)
      end
    end
    context 'when the object is created successfully' do
      it 'contains an empty array to store errors' do
        expect(linter_check_object.error_list).to be_a(Array)
      end
    end
  end
end

