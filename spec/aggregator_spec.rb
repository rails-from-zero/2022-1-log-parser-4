RSpec.describe LogParser::Aggregator do
  let(:aggregator) { described_class.new(entries) }
  let(:entries) {
    [
      LogParser::Entry.new("/about", "1.2.2.2"),
      LogParser::Entry.new("/about", "1.2.2.2"),
      LogParser::Entry.new("/about", "2.2.2.2"),
      LogParser::Entry.new("/home", "1.2.2.2"),
      LogParser::Entry.new("/home", "1.2.2.2")
    ]
  }

  describe "#group" do
    subject(:group) { aggregator.group }

    it "group entries by their path" do
      expect(group.keys).to match_array(["/home", "/about"])
    end

    it "stores total views" do
      expect(group.fetch("/about").total).to eql(3)
    end
  end
end
