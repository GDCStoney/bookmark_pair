# frozen_string_literal: true

require 'pg'

feature 'View list of Bookmarks' do
# added title to database model
#  scenario '- a user can see the bookmarks' do
#    # Add the test data
#    Bookmark.create(url: 'http://www.makersacademy.com')
#    Bookmark.create(url: 'http://www.symantec.com')
#    Bookmark.create(url: 'http://www.google.co.uk')
#
#    visit '/bookmarks'
#
#    expect(page).to have_content 'http://www.makersacademy.com'
#    expect(page).to have_content 'http://www.symantec.com'
#    expect(page).to have_content 'http://www.google.co.uk'
#  end

  scenario '- a user can see the bookmarks' do
    # Add the test data
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.symantec.com', title: 'Symantec US')
    Bookmark.create(url: 'http://www.google.co.uk', title: 'Google UK')

    visit '/bookmarks'

    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Symantec US'
    expect(page).to have_content 'Google UK'
  end
end
