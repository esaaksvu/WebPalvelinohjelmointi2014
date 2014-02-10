require 'spec_helper'

  describe "Beer page" do
    before :each do
      FactoryGirl.create :brewery
      FactoryGirl.create :beer
      visit new_beer_path
    end

    it "creates beer if beers name is valid" do
      fill_in 'beer_name', :with => 'Uuusi'
      ## undefined method `name' for nil:NilClass??
      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(1)
    end

    it "return new beer site if name is invalid" do
      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(0)
      expect(page).to have_content "New beer"
      expect(page).to have_content "Name can't be blank"

    end
end

