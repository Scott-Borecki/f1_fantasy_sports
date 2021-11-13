require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  context 'as an unauthenticated user' do
    context 'when I visit the home page' do
      before { visit root_path }

      it 'displays a title' do
        welcome_title = 'Welcome to the Unofficial Formula 1 Fantasy Game'

        expect(page).to have_content(welcome_title)
      end

      it 'displays a button to register' do
        register_text = 'PLAY NOW'

        expect(page).to have_link(register_text)
      end

      it 'displays a link to login' do
        login_text = 'Already registered? Log in'
        login_link_text = 'Log in'
        save_and_open_page

        expect(page).to have_content(login_text)
        expect(page).to have_link(login_link_text)
      end
    end
  end
end
