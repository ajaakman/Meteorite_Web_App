require 'rails_helper'

RSpec.describe Meteorite, type: :model do

  context 'validation tests' do
    it 'ensures name presence' do
      meteorite = Meteorite.new(mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures name uniqueness' do
      Meteorite.new(name: 'Bob', mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      meteorite = Meteorite.new(name: 'Bob', mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures class presence' do
      meteorite = Meteorite.new(name: 'Name', mass: 2.2, year: 1992, latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures mass presence' do
      meteorite = Meteorite.new(name: 'Name', year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures year presence' do
      meteorite = Meteorite.new(name: 'Name', mass: 2.2, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures latitude presence' do
      meteorite = Meteorite.new(name: 'Name', mass: 2.2, year: 1992, meteorite_class: 'A', longitude: 2.54).save
      expect(meteorite).to eq(false)
    end

    it 'ensures longitude presence' do
      meteorite = Meteorite.new(name: 'Name', mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43).save
      expect(meteorite).to eq(false)
    end

    it 'should save succefully' do
      Meteorite.new(name: 'Alice', mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      meteorite = Meteorite.new(name: 'Name', mass: 2.2, year: 1992, meteorite_class: 'A', latitude: 5.43, longitude: 2.54).save
      expect(meteorite).to eq(true)
    end
  end

  context 'scope tests' do
  end
end
