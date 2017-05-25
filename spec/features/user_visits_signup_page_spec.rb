require 'rails_helper'

feature 'User visit signup page' do
  scenario 'successfully' do
    visit signup_path

    expect(page).to have_css 'h1', text: 'Sign up'
  end
end
