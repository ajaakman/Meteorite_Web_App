require 'rails_helper'

RSpec.feature "Users", type: :feature do

  context "Users Log in" do
    let!(:user){create(:user)}
    scenario "Logs in the user when correct username and password are entered" do
      visit "/users/sign_in"
      fill_in "Email", :with => "user@test.com"
      fill_in "Password", :with => "secretpassword"
      click_button "Log in"
      expect(page).to have_no_content("Please Log in")
    end
    scenario "Don't log in user if password is incorrect" do
      visit "/users/sign_in"
      fill_in "Email", :with => "user@test.com"
      fill_in "Password", :with => "wrongpassword"
      click_button "Log in"
      expect(page).to have_content("Invalid Email or password.")
    end
  end

  context "Create new user" do
    let!(:user){create(:user)}
    scenario "Creates new user when entered field are valid" do
      visit "/users/sign_up"
      fill_in "Email", :with => "userunique@test.com"
      fill_in "Password", :with => "secretpassword"
      fill_in "Password confirmation", :with => "secretpassword"
      expect {click_button "Sign up"}.to change(User, :count).by(1)
    end
    scenario "Don't create when email already in use" do
      visit "/users/sign_up"
      fill_in "Email", :with => "user@test.com"
      fill_in "Password", :with => "secretpassword"
      fill_in "Password confirmation", :with => "secretpassword"
      expect {click_button "Sign up"}.to change(User, :count).by(0)
      expect(page).to have_content("Email has already been taken")
    end
    scenario "Dont create when confirmation password doesen't match" do
      visit "/users/sign_up"
      fill_in "Email", :with => "userunique@test.com"
      fill_in "Password", :with => "secretpassword"
      fill_in "Password confirmation", :with => "differentpassword"
      expect {click_button "Sign up"}.to change(User, :count).by(0)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

end
