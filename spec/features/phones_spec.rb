require 'rails_helper'

RSpec.feature "Phones", type: :feature do
  describe "As a user on the registration page I can add all of my phone numbers" do
    it "should allow users to enter up to three phone numbers" do
      visit "/"
      expect(page).to have_content("Phone 1")
      expect(page).to have_content("Phone 2")
      expect(page).to have_content("Phone 3")
    end
  end

  #testing registration page connection to the database
  describe "When a user submits information, the phone numbers are saved to the phones table" do
    it "should add a record to the phones table when the user submits info" do
      fill_form
      expect(Phone.last.phone).to eq('555-555-5555')
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
    fill_in 'password', with: 'Pass123word!'
    click_button 'Submit'
  end
end
