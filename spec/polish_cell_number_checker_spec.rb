require 'spec_helper'

describe PolishCellNumber::Checker do
  describe ".cell_number?" do
    context "when passing number is cell number" do
      it "return true" do
        expect(PolishCellNumber::Checker.new('+48 608-111-111').cell_number?).to be_truthy
      end
    end

    context "when passing number is not cell number" do
      it "return false" do
        expect(PolishCellNumber::Checker.new('+48 751-11-111').cell_number?).to be_falsey
      end
    end

    context "when passing number is not valid number" do
      it "return false" do
        expect(PolishCellNumber::Checker.new('+48 751-11').cell_number?).to be_falsey
      end
    end
  end

  describe ".operator_name" do
    context "when passing number is cell number" do
      it "return operator name" do
        expect(PolishCellNumber::Checker.new('+48 608-111-111').operator_name).to eq 'T-MOBILE POLSKA S.A. (d. PTC S.A.)'
      end
    end

    context "when passing number is not cell number" do
      it "return nil" do
        expect(PolishCellNumber::Checker.new('+48 751-11-111').operator_name).to be_nil
      end
    end

    context "when passing number is not valid number" do
      it "return nil" do
        expect(PolishCellNumber::Checker.new('+48 751-11').operator_name).to be_nil
      end
    end
  end
end
