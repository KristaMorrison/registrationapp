require 'rails_helper'

RSpec.feature "Users", type: :feature do
  #testing registration page from user perspective
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

  #testing registration page connection to the database
  describe "When a user submits information, it is saved to the user table" do
    it "should add a record to the users table when the user submits info, excluding phone numbers" do
      fill_form
      expect(User.first).to be_a(User)
      expect(User.first.first).to eq('Bob')
    end
    it "wont allow spaces as characters for user information" do
      visit '/'
      fill_in 'first_name', with: '     '
      fill_in 'last_name', with: '     '
      fill_in 'street', with: '     '
      fill_in 'city', with: '     '
      fill_in 'state', with: '     '
      fill_in 'zip', with: '92101'
      fill_in 'country', with: '     '
      fill_in 'phone1', with: '     '
      fill_in 'email', with: '     '
      fill_in 'username', with: '     '
      fill_in 'password', with: '     '
      click_button 'Submit'
      expect(page).to have_content("Invalid characters entered")
    end
  end

  #helper function to fill out the form and submit it
  def fill_form
    visit "/"
    fill_in 'first_name', with: 'Bob'
    fill_in 'last_name', with: 'Smith'
    fill_in 'street', with: '123 Anywhere St.'
    fill_in 'city', with: 'San Diego'
    fill_in 'state', with: 'CA'
    fill_in 'zip', with: '92101'
    fill_in 'country', with: 'USA'
    fill_in 'phone1', with: '555-555-5555'
    fill_in 'email', with: 'bob@home.com'
    fill_in 'username', with: 'BobSmith1'
    fill_in 'password', with: 'pass123word'
    click_button 'Submit'
  end
end
