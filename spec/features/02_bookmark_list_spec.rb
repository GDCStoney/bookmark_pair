# frozen_string_literal: true

feature 'View list of Bookmarks' do
  scenario '- a user can see the bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.symantec.com'
    expect(page).to have_content 'http://www.google.co.uk'
  end
end
