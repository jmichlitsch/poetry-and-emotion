require 'rails_helper'

describe 'As a User' do
  describe 'when I get to the /search page' do
    it 'I see a list of the first 10 poems' do
      visit '/'
      page.fill_in 'author', with: 'Emily'
      click_on('Get Poems')
      expect(current_path).to eq('/search')
      expect(page).to have_css(".poem", count: 10)
      within first(".poem") do
         expect(page).to have_css(".poem_title")
         expect(page).to have_css(".poem_tone")
         expect(page).to have_css(".poem_lines")
      end
    end
  end
end
