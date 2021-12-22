RSpec.describe LogParser::Parser do
  let(:parser) { described_class.new("some/file") }

  describe "#format" do
    subject { parser.format }

    let(:reader) {
      instance_double(LogParser::FileReader, lines: ["/about-us 1.1.1.1", "/contact 2.2.2.2"])
    }

    before do
      allow(LogParser::FileReader).to receive(:new).with("some/file").and_return(reader)
    end

    it { is_expected.to include("Entries by total views") }
  end
end
