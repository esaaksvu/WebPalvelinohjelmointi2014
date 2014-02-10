require 'spec_helper'

  describe "Beer page" do

    it "creates beer if name is valid" do
      visit  new_beer_path
      fill_in('beer_name', with:'Olut')
      click_button('Create Beer')
      expect(page).to have_content "Olut"
    end

    it "return new beer site if name is invalid" do
      visit  new_beer_path
      fill_in('beer_name', with:'')
      click_button('Create Beer')
      expect(page).to have_content "New beer"
    end
end

