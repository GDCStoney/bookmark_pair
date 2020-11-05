# frozen_string_literal: true

feature 'Delete message' do
  scenario 'user deletes existing message' do
    enter_test_bookmark
    first('.item').click_button 'Del'

    expect(page).not_to have_content 'Test Bookmark'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Sinatra'
  end


end
