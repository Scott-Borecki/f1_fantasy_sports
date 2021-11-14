require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  context 'as an unauthenticated user' do
    context 'when I visit the home page' do
      before { visit root_path }

      context 'when I click on the link to log in' do
        before { click_link 'Log in' }

        it 'redirects me to the login page' do
          expect(page).to have_current_path('/login')
        end

        it 'displays a form to login' do
          expect(page).to have_field('username')
          expect(page).to have_field('password')
        end

        context 'when I fill in the login form with valid inputs' do
          let!(:registered_user) { create(:user) }
          let(:username) { registered_user.username }
          let(:password) { registered_user.password }

          before do
            fill_in 'username', with: username
            fill_in 'password', with: password

            click_on 'SIGN IN'
          end

          it 'redirects me to my dashboard' do
            expect(page).to have_current_path(dashboard_index_path)
            expect(page).to have_content("Welcome, #{registered_user.first_name}!")
          end

          it 'displays a success message' do
            expect(page).to have_content('Login successful!')
          end
        end

        context 'when I fill in the login form with invalid inputs' do
        end

        it 'displays a link to register' do
          register_text = "Don't have an account yet? Register with F1"
          register_link = 'Register with F1'

          expect(page).to have_content(register_text)
          expect(page).to have_link(register_link)
        end

        context 'when I click the register link' do
          let(:register_link) { 'Register with F1' }

          before { click_on register_link }

          it 'redirects me to the register page' do
            expect(page).to have_current_path(register_path)
          end
        end
      end
    end
  end
end
