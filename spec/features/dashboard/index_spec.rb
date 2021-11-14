require 'rails_helper'

RSpec.describe 'dashboard page', type: :feature do
  context 'as an authenticated user' do
    let!(:user) { create(:user) }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

    context 'when I have not made any teams' do
      context 'when I visit the dashboard page' do
        before { visit dashboard_index_path }

        it 'displays my teams section' do
          my_teams_section_title = "#{user.first_name}'s Teams"

          expect(page).to have_content(my_teams_section_title)
        end

        it 'displays a message that I have no teams' do
          no_teams_message = 'You have not created any teams yet.'

          expect(page).to have_content(no_teams_message)
        end

        it 'displays a link to create a team' do
          create_team_link = 'CREATE TEAM'

          expect(page).to have_link(create_team_link)
        end
      end
    end
  end
end
