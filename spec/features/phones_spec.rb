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
end
