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

          within '#my-teams' do
            expect(page).to have_content(my_teams_section_title)
          end
        end

        it 'displays a message that I have no teams' do
          no_teams_message = 'You have not created any teams yet.'

          within '#my-teams' do
            expect(page).to have_content(no_teams_message)
          end
        end

        it 'displays a link to create a team' do
          create_team_link = 'CREATE TEAM'

          within '#my-teams' do
            expect(page).to have_link(create_team_link)
          end
        end
      end
    end

    context 'when I have made some teams' do
      context 'when I visit the dashboard page' do
        # See spec/factories/user_teams.rb for #create_valid_user_team test setup.
        let!(:user_team1) { create_valid_user_team(user) }
        let!(:user_team2) { create_valid_user_team(user) }
        let!(:user_team3) { create_valid_user_team(user) }

        before { visit dashboard_index_path }

        it 'displays my teams section' do
          my_teams_section_title = "#{user.first_name}'s Teams"

          within '#my-teams' do
            expect(page).to have_content(my_teams_section_title)
          end
        end

        it 'displays my teams' do
          within '#my-teams' do
            user.user_teams.each do |user_team|
              within "#user-team-#{user_team.id}" do
                expect(page).to have_content(user_team.name)
                expect(page).to have_content(user_team.budget_remaining)

                user_team.players.each do |player|
                  within "#player-#{player.id}" do
                    expect(page).to have_content(player.first_name)
                    expect(page).to have_content(player.last_name)
                    expect(page).to have_content("$#{player.price}m")
                  end
                end
              end
            end
          end
        end

        it 'displays a link to edit my team' do
          within '#my-teams' do
            expect(page).to have_link('EDIT TEAM')
          end
        end
      end
    end
  end
end
