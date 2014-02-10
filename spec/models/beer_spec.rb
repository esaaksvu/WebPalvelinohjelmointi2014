require 'spec_helper'

describe Beer do

    it "with style and name is saved" do
      old_beer_count = Beer.count
      beer =  Beer.create name:"Olut", style:"Weizen"
      expect(beer).to be_valid
      expect(Beer.count).to eq(old_beer_count+1)
    end

    it  "without name is not saved" do
      old_beer_count = Beer.count
      beer =  Beer.create style:"Weizen"
      expect(beer).not_to be_valid
      expect(Beer.count).to eq(old_beer_count)
    end

    it "without style is not saved" do
      old_beer_count = Beer.count
      beer = Beer.create name:"Olut"
      expect(beer).not_to be_valid
      expect(Beer.count).to eq(old_beer_count)
    end



end