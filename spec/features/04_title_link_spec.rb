# frozen_string_literal: true

feature 'new display with title links' do
  scenario 'display the title with a link' do
    enter_test_bookmark
    expect(page).to have_link("Test Bookmark", href: 'http://testbookmark.com')
  end
end
