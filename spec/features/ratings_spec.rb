require 'spec_helper'

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }
  let!(:rating1) { FactoryGirl.create :rating, score: 3, beer:beer1, user:user}
  let!(:rating2) { FactoryGirl.create :rating,  score: 3, beer:beer2, user:user}
  let!(:rating3) { FactoryGirl.create :rating,  score: 3, beer:beer1, user:user}

  before :each do
    visit signin_path
    fill_in('username', with:'Pekka')
    fill_in('password', with:'Foobar1')
    click_button('Log in')
  end

  ##undefined method `name' for nil:NilClass??
  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end

  it "lists the ratings and their total number" do
    visit ratings_path
    expect(page).to have_content "Number of ratings #{Rating.count}"
    Rating.to_enum.each_entry expect(page).to have_content

  end

end
