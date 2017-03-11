require "set"
require "dna/text/ext"

module Dna
  module Text
    class << self
      include Dna::Text::Ext

      def count(text, pattern)
        count = 0

        (0..text.size - pattern.size).each do |i|
          if text.slice(i, pattern.size) == pattern
            count += 1
          end
        end

        count
      end

      def frequent_words(text, k)
        frequent_patterns = Set.new
        counts = []
        indexes = []

        (0..text.size - k).each do |i|
          pattern = pattern_to_number(text.slice(i, k))
          indexes[i] = pattern
          counts[i] = 1
        end

        indexes = indexes.sort

        (1..text.size - k).each do |i|
          if indexes[i] == indexes[i - 1]
            counts[i] = counts[i - 1] + 1
          end
        end

        max_count = counts.max

        (0..text.size - k).each do |i|
          if counts[i] == max_count
            pattern = number_to_pattern(indexes[i], k)
            frequent_patterns.add(pattern)
          end
        end

        frequent_patterns
      end

      def starting_positions(pattern, text)
        positions = []

        (0..text.size - pattern.size).each do |i|
          slice = text.slice(i, pattern.size)
          positions.push(i) if slice == pattern
        end

        positions
      end

      def number_to_pattern(number, k)
        pattern = ""

        while number > 0
          rem = number % 4
          pattern = number_to_symbol(rem).concat(pattern)
          number = number / 4
        end

        ("A" * (k - pattern.size)).concat(pattern)
      end

      def frequencies(text, k)
        frequencies = Hash.new(0)

        (0..text.size - k).each do |i|
          pattern = pattern_to_number(text.slice(i, k))
          frequencies[pattern] = frequencies[pattern] + 1
        end

        frequencies
      end

      private

      def number_to_symbol(number)
        case number
        when 0 then "A"
        when 1 then "C"
        when 2 then "G"
        when 3 then "T"
        end
      end
    end
  end
end
