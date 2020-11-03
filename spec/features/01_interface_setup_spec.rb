# frozen_string_literal: true

feature 'User Interface available' do
  scenario '- initial screen with title is visible' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
