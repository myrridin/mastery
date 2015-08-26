require 'spec_helper'

RSpec.describe Offering, type: :model do

  let(:offering) { FactoryGirl.build_stubbed :offering }
  let(:offering_full) { FactoryGirl.build_stubbed :offering, :full }
  let(:offering_past) { FactoryGirl.build_stubbed :offering, scheduled_at: Date.yesterday }

  describe '#available?' do
    it 'returns true if there are empty seats and it is in the future' do
      expect(offering.available?).to be_truthy
    end

    it 'returns false if there are no empty seats' do
      expect(offering_full.available?).to be_falsey
    end

    it 'returns false if the start time has already passed' do
      expect(offering_past.available?).to be_falsey
    end
  end

  describe '#empty_seats?' do
    it 'returns true if signed_up is less than the size' do
      expect(offering.empty_seats?).to be_truthy
    end

    it 'returns false if signed_up is equal to size' do
      expect(offering_full.empty_seats?).to be_falsey
    end
  end
end
