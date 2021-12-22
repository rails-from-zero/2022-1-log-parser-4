RSpec.describe LogParser::Accumulator do
  let(:accumulator) { described_class.new }

  describe "#add" do
    subject(:add_entry) { accumulator.add(entry) }

    let(:entry) { LogParser::Entry.new("/home", "1.1.1.1") }

    it "increments total views" do
      expect { add_entry }.to change { accumulator.total }.by(1)
    end

    it "increments unique views" do
      expect { add_entry }.to change { accumulator.unique }.by(1)
    end

    context "with existing entry ip" do
      before do
        accumulator.ips["1.1.1.1"] = true
      end

      it "does not increment unique views" do
        expect { add_entry }.to_not change { accumulator.unique }
      end
    end
  end
end
