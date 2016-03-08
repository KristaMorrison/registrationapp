require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "As a user, I can visit the registration page" do
    it "should let me enter my personal information" do
      visit "/"
      expect(page).to have_content("First Name")
      expect(page).to have_content("Last Name")
      expect(page).to have_content("Street Address")
      expect(page).to have_content("City")
      expect(page).to have_content("State")
      expect(page).to have_content("Zip Code")
      expect(page).to have_content("Country")
      expect(page).to have_content("Email")
      expect(page).to have_content("Username")
      expect(page).to have_content("Password")
    end
    it "should allow me to enter and submit my information" do
      visit "/"
      fill_in 'first_name', with: 'Bob'
      click_button 'Submit'
    end
  end
end
