require "spec_helper"

module Dna
  describe Strand do
    describe "::complement" do
      it "generates complement to a strand" do
        expect(Strand.complement("AAAACCCGGT")).to eq("ACCGGGTTTT")
      end
    end
  end
end
