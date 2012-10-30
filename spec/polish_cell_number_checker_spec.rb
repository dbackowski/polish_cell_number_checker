require 'spec_helper'

describe PolishCellNumber::Checker do
  describe ".cell_number?" do
    context "when passing number is cell number" do
      it "return true" do
        PolishCellNumber::Checker.new('+48 608-111-111').cell_number?.should be_true
      end
    end

    context "when passing number is not cell number" do
      it "return false" do
        PolishCellNumber::Checker.new('+48 751-11-111').cell_number?.should_not be_true
      end
    end

    context "when passing number is not valid number" do
      it "return false" do
        PolishCellNumber::Checker.new('+48 751-11').cell_number?.should_not be_true
      end
    end
  end

  describe ".operator_name" do
    context "when passing number is cell number" do
      it "return operator name" do
        PolishCellNumber::Checker.new('+48 608-111-111').operator_name.should eql 'PTC S.A.'
      end
    end

    context "when passing number is not cell number" do
      it "return nil" do
        PolishCellNumber::Checker.new('+48 751-11-111').operator_name.should be_nil
      end
    end

    context "when passing number is not valid number" do
      it "return nil" do
        PolishCellNumber::Checker.new('+48 751-11').operator_name.should be_nil
      end
    end
  end
end