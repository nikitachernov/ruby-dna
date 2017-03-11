require "set"

module Dna
  module Genome
    class << self
      # def clump(genome, k, l, t)
      #   patterns = Set.new
      #   clumps = {}

      #   text = genome.slice(0, l)
      #   frequencies = Text.frequencies(text, k)

      #   frequencies.each do |i, count|
      #     if count >= t
      #       clumps[i] = true
      #     end
      #   end

      #   (1..genome.size - l).each do |i|
      #     first_pattern = genome.slice(i - 1, k)
      #     index = Text.pattern_to_number(first_pattern)
      #     frequencies[index] = frequencies[index] - 1

      #     last_pattern = genome.slice(i + l - k, k)
      #     index = Text.pattern_to_number(last_pattern)
      #     frequencies[index] = frequencies[index] + 1

      #     if frequencies[index] >= t
      #       clumps[index] = true
      #     end
      #   end

      #   clumps.each do |i, present|
      #     if present
      #       pattern = Text.number_to_pattern(i, k)
      #       patterns.add(pattern)
      #     end
      #   end

      #   patterns
      # end

      def clump(genome, k, l, t)
        patterns = Set.new
        clumps = {}

        text = genome.slice(0, l)
        frequencies = Text.frequencies(text, k)

        frequencies.each do |i, count|
          if count >= t
            clumps[i] = true
          end
        end

        (1..genome.size - l).each do |i|
          first_pattern = genome.slice(i - 1, k)
          index = Text.pattern_to_number(first_pattern)
          frequencies[index] = frequencies[index] - 1

          last_pattern = genome.slice(i + l - k, k)
          index = Text.pattern_to_number(last_pattern)
          frequencies[index] = frequencies[index] + 1

          if frequencies[index] >= t
            clumps[index] = true
          end
        end

        clumps.each do |i, present|
          if present
            pattern = Text.number_to_pattern(i, k)
            patterns.add(pattern)
          end
        end

        patterns
      end
    end
  end
end
