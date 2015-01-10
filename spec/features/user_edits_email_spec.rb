require 'rails_helper'

feature 'user edits email', %{
  As an authenticated user, I want to edit my email, so that I can continue
  using my account when I get a new email address.
  Acceptance Criteria:
  * [X] - I can update my email address.
  * [X] - I see an error if my new email address is invalid.
  * [ ] - I must confirm my email address.
  * [ ] - My account will be deleted if I don't confirm my email address.
  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    scenario 'user edits optional information' do
      log_in_as(user)
      visit edit_user_registration_path(user)

      fill_in "user[email]", with: "lamhirh.ablairsec@abhnation.com"
      fill_in "user[current_password]", with: user.password
      click_button "Update"

      expect(page).to have_content("Your account has been updated successfully.")
    end
  end
