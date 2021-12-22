RSpec.describe LogParser::Tokenizer do
  let(:tokenizer) { described_class.new(lines) }
  let(:lines) {
    [
      "/about-us 191.14.205.179",
      "/features 214.236.57.207"
    ]
  }

  describe "#entries" do
    subject { tokenizer.entries.to_a }

    let(:expected_entries) {
      [
        LogParser::Entry.new("/about-us", "191.14.205.179"),
        LogParser::Entry.new("/features", "214.236.57.207")
      ]
    }

    it { is_expected.to eql(expected_entries) }
  end
end
