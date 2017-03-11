require "spec_helper"

module Dna
  describe Text do
    describe "::count" do
      it "should calculate occurances of a pattern" do
        expect(Text.count("GCGCG", "GCG")).to eq(2)
      end
    end

    describe "::frequent_words" do
      it "should calculate frequent words" do
        text = "ACGTTGCATGTCGCATGATGCATGAGAGCT"
        expect(Text.frequent_words(text, 4)).to eq(["CATG", "GCAT"].to_set) end
    end

    describe "::pattern_to_number" do
      it "should calculate a number from a pattern" do
        expect(Text.pattern_to_number("AGT")).to eq(11)
      end
    end

    describe "::number_to_pattern" do
      it "should calculate a number from a pattern" do
        expect(Text.number_to_pattern(45, 4)).to eq("AGTC")
      end
    end

    describe "::starting_positions" do
      it "should calculate starting positions of a pattern" do
        text = "GATATATGCATATACTT"
        expect(Text.starting_positions("ATAT", text)).to eq([1, 3, 9])
      end

      it "should calculate starting positions of a pattern in a bacteria" do
        text = File.read("spec/fixtures/Vibrio_cholerae.txt")
        pattern = "CTTGATCAT"

        expected = [
          60039, 98409, 129189, 152283, 152354, 152411, 163207, 197028, 200160,
          357976, 376771, 392723, 532935, 600085, 622755, 1065555
        ]

        expect(Text.starting_positions(pattern, text)).to eq(expected)
      end
    end
  end
end
