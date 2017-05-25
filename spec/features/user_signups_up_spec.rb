require "rails_helper"

feature 'User signs up' do
  scenario 'successfully' do
    visit signup_path

    fill_in 'Email', with: 'test_user@user.com'
    click_on 'Create my account'

    expect(page).to have_css '.flash-notice', text: 'Login link sent to your email'
  end
end
