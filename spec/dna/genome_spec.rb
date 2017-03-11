require "spec_helper"

module Dna
  describe Genome do
    describe "::clump" do
      it "finds a clump in a genome" do
        genome = "CGGACTCGACAGATGTGAAGAACGACAATG"
        genome = genome.concat("TGAAGACTCGACACGACAGAGTGAAGAGAAGAGGAAACATTGTAA")
        expect(Genome.clump(genome, 5, 50, 4)).to eq(["CGACA", "GAAGA"].to_set)
      end

      it "finds a clump in a bacteria" do
        genome = File.read("spec/fixtures/E_coli.txt")
        expect(Genome.clump(genome, 9, 500, 3).size).to eq(1904)
      end
    end
  end
end
