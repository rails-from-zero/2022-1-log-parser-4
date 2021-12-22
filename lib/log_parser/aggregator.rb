module LogParser
  class Aggregator
    def initialize(entries)
      @entries = entries
    end

    def group
      @entries.each_with_object(AggregatorResult.new) do |entry, collection|
        collection[entry.path] ||= Accumulator.new
        collection[entry.path].add(entry)
      end
    end
  end
end
