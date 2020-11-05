feature 'Update a bookmark' do
  scenario 'takes to edit page' do
    enter_test_bookmark
    find_button('edit').click

    expect(current_path).to eq '/bookmarks/update'
  end

  scenario 'able to edit the bookmark' do
    enter_test_bookmark
    find_button('edit').click
    fill_in('title', with: 'Updated Bookmark')
    fill_in('url', with: 'http://www.swizelwashere.com')
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Test Bookmark'
    expect(page).to have_content 'Updated Bookmark'
  end
end
