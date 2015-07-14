require 'rails_helper'

feature 'user visits homepage', %{
  As a user
  I want to visit the homepage
  So that I can click a link to view nearby dog parks
} do
  # Acceptance Criteria
  # [] I do not have to be a registered user
  # [] The do this from the root path

  scenario 'any visitor visits homepage' do
    user = FactoryGirl.create(:user)

    visit "/"

    expect(page).to have_content('BarkPark')
    expect(page).to have_link('Fetch!')

    click_on('Fetch!')

    expect(page).to have_content('BarkPark Map')
  end
end