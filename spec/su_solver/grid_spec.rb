require 'spec_helper'

describe SuSolver::Grid do
  let(:grid) { SuSolver::Grid.new(input) }
  let(:input) { '052006000160900004049803620400000800083201590001000002097305240200009056000100970'}

  describe "#set_grid_value" do
    it 'updates the first row' do
      grid.set_grid_value(0, 0, "5")
      grid.rows.first.should == "552006000"
    end

    it 'updates the last row' do
      grid.set_grid_value(8, 0, "9")
      grid.rows.last.should == "900100970"
    end
  end

  describe "#valid?" do
    it 'should have valid columns and rows' do

      # grid.should be_valid
    end
  end

  describe "#missing_values" do
    it 'gives us the missing values' do
      grid.missing_values('012345678').should == ['9']
      grid.missing_values('002345678').should =~ ['9', '1']
    end
  end

  describe '#available_values' do
    it 'returns all available values for a given cell' do
      grid.available_values(0, 0).should =~ ['3', '7', '8']
    end
  end

  context "invalid grid" do
    let(:input) { "111111111111111111111111111111111111111111111111111111111111111111111111111111111" }

    it "should not be valid" do
      grid.should_not be_valid
    end
  end


  describe "#solved?" do
    it "returns true when no zeros are in the grid" do
      SuSolver::Grid.new('123456789123456789123456789123456789123456789123456789123456789123456789123456789').should be_solved
    end

    it "returns false when at least one zero is in the grid" do
      SuSolver::Grid.new('123456789123456789120456789123456789123456789123456789123456789123456789123456789').should_not be_solved
    end
  end

  describe '#rows' do
    it 'returns an array' do
      grid.rows.should be_an(Array)
    end

    it 'returns a correct row' do
      grid.rows.first.should == '052006000'
      grid.rows.last.should == '000100970'
    end

    it 'returns 9 rows' do
      grid.rows.size.should == 9
    end
  end

  describe '#columns' do
    let(:input) { '012345678012345678012345678012345678012345678012345678012345678012345678012345678'}

    it 'returns an array' do
      grid.columns.should be_an(Array)
    end

    it 'returns a correct column' do
      grid.columns.first.should == '000000000'
      grid.columns.last.should == '888888888'
    end

    it 'returns 9 columns' do
      grid.columns.size.should == 9
    end
  end

  describe '#groups' do
    let(:input) { '352476189168952734749813625425697813683241597971538462897365241214789356536124978' }

    it 'returns an array' do
      grid.groups.should be_an(Array)
    end

    it 'returns the correct groups' do
      grid.groups.first.should == '352168749'
      grid.groups.last.should == '241356978'
    end

    it 'returns 9 groups' do
      grid.groups.size.should == 9
    end
  end
end