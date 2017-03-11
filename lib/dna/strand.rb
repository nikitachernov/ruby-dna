module Dna
  module Strand
    class << self
      def complement(strand)
        complement = ""

        (0..strand.size - 1).each do |i|
          char = char_to_complement(strand[i])
          complement = char.concat(complement)
        end

        complement
      end

      private

      def char_to_complement(char)
        case char
        when "A" then "T"
        when "C" then "G"
        when "G" then "C"
        when "T" then "A"
        end
      end
    end
  end
end
