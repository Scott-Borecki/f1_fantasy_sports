require 'rails_helper'

RSpec.describe 'register page', type: :feature do
  context 'as an unauthenticated user' do
    context 'when I visit the home page' do
      before { visit root_path }

      context 'when I click on the link to register' do
        before { click_link 'PLAY NOW' }

        it 'redirects me to the register page' do
          expect(page).to have_current_path('/register')
        end

        it 'displays a form to register' do
          expect(page).to have_field('user[first_name]')
          expect(page).to have_field('user[last_name]')
          expect(page).to have_field('user[username]')
          expect(page).to have_field('user[password]')
          expect(page).to have_field('user[password_confirmation]')
        end

        context 'when I fill in the registration form with valid inputs' do
          let(:first_name) { Faker::Name.first_name }
          let(:last_name) { Faker::Name.last_name }
          let(:username) { Faker::Internet.username }
          let(:password) { Faker::Internet.password }

          before do
            fill_in 'user[first_name]', with: first_name
            fill_in 'user[last_name]', with: last_name
            fill_in 'user[username]', with: username
            fill_in 'user[password]', with: password
            fill_in 'user[password_confirmation]', with: password

            click_on 'REGISTER'
          end

          it 'redirects me to my dashboard' do
            expect(page).to have_current_path(dashboard_index_path)
            expect(page).to have_content("Welcome, #{first_name}!")
          end

          it 'displays a success message' do
            expect(page).to have_content('Registration successful!')
          end
        end

        context 'when I fill in the registration form with invalid inputs' do

        end

        it 'displays a link to login' do
          login_text = 'Already registered? Log in'
          login_link_text = 'Log in'

          expect(page).to have_content(login_text)
          expect(page).to have_link(login_link_text)
        end

        context 'when I click the login link' do
          let(:login_link_text) { 'Log in' }

          before { click_on login_link_text }

          it 'redirects me to the login page' do
            expect(page).to have_current_path(login_path)
          end
        end
      end
    end
  end
end
