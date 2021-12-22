RSpec.describe LogParser::AggregatorResult do
  let(:result) { described_class[grouped_entries] }
  let(:grouped_entries) {
    {
      "/about" => accumulator1,
      "/home" => accumulator2,
      "/contact-us" => accumulator3
    }
  }
  let(:accumulator1) { instance_double(LogParser::Accumulator, unique: 5, total: 5) }
  let(:accumulator2) { instance_double(LogParser::Accumulator, unique: 10, total: 25) }
  let(:accumulator3) { instance_double(LogParser::Accumulator, unique: 2, total: 150) }

  describe "#sort_by_total" do
    subject { result.sort_by_total }

    let(:expected_sorted_entries) {
      [
        ["/contact-us", accumulator3],
        ["/home", accumulator2],
        ["/about", accumulator1]
      ]
    }

    it { is_expected.to eql(expected_sorted_entries) }
  end

  describe "#sort_by_unique" do
    subject { result.sort_by_unique }

    let(:expected_sorted_entries) {
      [
        ["/home", accumulator2],
        ["/about", accumulator1],
        ["/contact-us", accumulator3]
      ]
    }

    it { is_expected.to eql(expected_sorted_entries) }
  end
end
