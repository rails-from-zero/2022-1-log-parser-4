module LogParser
  class Formatter
    def initialize(aggregator_result)
      @aggregator_result = aggregator_result
    end

    def format
      <<~EOF
        Entries by total views:
        #{total_views}

        Entries by unique views:
        #{unique_views}
      EOF
    end

    private

    def total_views
      @aggregator_result.sort_by_total.map do |path, accumulator|
        "#{path} #{accumulator.total} visits"
      end.join("\n")
    end

    def unique_views
      @aggregator_result.sort_by_unique.map do |path, accumulator|
        "#{path} #{accumulator.unique} unique visits"
      end.join("\n")
    end
  end
end
