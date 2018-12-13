require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "Go to Home page" do
    visit root_path
    expect(page).to have_content("Welcome to Artur's APP")
  end

  scenario "Go to Home page from navbar" do
    visit root_path
    within('.navbar'){
      click_on "Home"
    }
    expect(page).to have_content("Welcome to Artur's APP")
  end

  scenario "Go to About page from navbar" do
    visit root_path
    within('.navbar'){
      click_on "About"
    }
    expect(page).to have_content("This app was made by Artur Jaakman for the AWAD individual assessment.")
  end

  scenario "Go to Meteorites page from navbar" do
    visit root_path
    within('.navbar'){
      click_on "Meteorites"
    }
    expect(page).to have_content("Meteorites")
  end

end
