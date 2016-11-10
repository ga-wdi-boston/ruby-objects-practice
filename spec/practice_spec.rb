# frozen_string_literal: true
require_relative '../lib/practice.rb'
RSpec.describe MBTA::Subway::System do
  before :all do
    @mbta = MBTA::Subway::System.new
  end

  describe 'Red Line' do
    it 'goes from "Alewife" to "South Station' do
      expect(@mbta.stops_between_stations('Red', 'Alewife',
                                          'Red', 'South Station')).to eq(7)
    end

    it 'goes from "South Station" to "Alewife"' do
      expect(@mbta.stops_between_stations('Red', 'South Station',
                                          'Red', 'Alewife')).to eq(7)
    end
  end

  describe 'Green Line' do
    it 'goes from "Government Center" to "Kenmore"' do
      expect(@mbta.stops_between_stations('Green', 'Government Center',
                                          'Green', 'Kenmore')).to eq(6)
    end

    it 'goes from "Kenmore" to "Government Center"' do
      expect(@mbta.stops_between_stations('Green', 'Kenmore',
                                          'Green',
                                          'Government Center')).to eq(6)
    end
  end

  describe 'Orange Line' do
    it 'goes from "North Station" to "Forest Hills"' do
      expect(@mbta.stops_between_stations('Orange', 'North Station',
                                          'Orange', 'Forest Hills')).to eq(7)
    end

    it 'goes from "Forest Hills" to "North Station"' do
      expect(@mbta.stops_between_stations('Orange', 'Forest Hills',
                                          'Orange', 'North Station')).to eq(7)
    end
  end

  describe 'Red and Green Lines' do
    it 'goes from "South Station" to "Kenmore"' do
      expect(@mbta.stops_between_stations('Red', 'South Station',
                                          'Green', 'Kenmore')).to eq(6)
    end

    it 'goes from "Government Center" to "Alewife"' do
      expect(@mbta.stops_between_stations('Green', 'Government Center',
                                          'Red', 'Alewife')).to eq(7)
    end
  end

  describe 'Red and Orange Lines' do
    it 'goes from "South Station" to "Forest Hills"' do
      expect(@mbta.stops_between_stations('Red', 'South Station',
                                          'Orange', 'Forest Hills')).to eq(6)
    end

    it 'goes from "North Station" to "Alewife"' do
      expect(@mbta.stops_between_stations('Orange', 'North Station',
                                          'Red', 'Alewife')).to eq(8)
    end
  end

  describe 'Green and Orange Lines' do
    it 'goes from "Government Center" to "Forest Hills"' do
      expect(@mbta.stops_between_stations('Green', 'Government Center',
                                          'Orange', 'Forest Hills')).to eq(6)
    end
    it 'goes from "North Station" to "Kenmore"' do
      expect(@mbta.stops_between_stations('Orange', 'North Station',
                                          'Green', 'Kenmore')).to eq(7)
    end
  end

  if MBTA::Subway::System.stretch
    describe 'Green and Orange Lines' do
    end
  end
end
