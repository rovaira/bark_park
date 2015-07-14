require 'rails_helper'

feature 'user deletes account', %{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
} do

  #  Acceptance Criteria
  # [X] When I'm signed in, I have the option to go to my "Edit Profile" page and
  # select a button to delete my account
  # [X] I receive a confirmation that my account has been cancelled
  # [X] And therefore, I am no longer signed into my account

  scenario 'user deletes account from edit page' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content('Signed in successfully')

    visit edit_user_registration_path

    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully
                                 cancelled.')
    expect(page).to have_content('Sign Up')
  end
end
