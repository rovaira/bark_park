require 'rails_helper'

feature 'edit_user_registration', %{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
} do
  # Acceptance Criteria
  # [] I need to be a registered user
  # [] I can click an 'Edit Profile' link to make changes

  scenario 'any visitor visits homepage' do
    user = FactoryGirl.create(:user)

    visit "/"

    expect(page).to have_content('BarkPark')
    expect(page).to have_link('Fetch!')

    click_on('Fetch!')

    expect(page).to have_content('BarkPark Map')
  end
end