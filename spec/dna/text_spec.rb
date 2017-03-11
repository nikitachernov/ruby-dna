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
        expect(Text.frequent_words(text, 4)).to eq(["CATG", "GCAT"].to_set)
      end
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
  end
end
