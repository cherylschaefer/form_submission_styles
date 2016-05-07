require 'spec_helper'

feature 'Snowflakes' do
  it 'requires login' do
    visit new_snowflake_path

    expect(page.text).to include "You need to sign in or sign up before continuing."
    expect(current_path).to eq new_user_session_path
  end
  context 'when logged in as a user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { login_as user }
    after(:each) { logout }

    it 'can be created' do
      visit root_path
      click_on 'Create new snowflake'
      expect(current_path).to eq new_snowflake_path
      fill_in 'snowflake_name', with: "Fractalus"

      click_on 'Create Snowflake'

      expect(Snowflake.count).to eq 1
      expect(Snowflake.last.name).to eq "Fractalus"
      expect(current_path).to eq root_path
      expect(Snowflake.last.image).not_to be_nil
    end
    it 'can not be created even if one of the same name already exists' do
      flake = FactoryGirl.create(:snowflake, user: user)
      visit root_path
      click_on 'Create new snowflake'
      expect(current_path).to eq new_snowflake_path
      fill_in 'snowflake_name', with: flake.name

      click_on 'Create Snowflake'

      expect(Snowflake.count).to eq 1
      expect(Snowflake.last.name).to eq flake.name
      expect(current_path).to eq snowflakes_path
    end
    it 'can be deleted' do
      flake = FactoryGirl.create(:snowflake, user: user)
      expect(Snowflake.count).to eq 1
      visit root_path

      click_on "Delete #{flake.name}"

      #puts page.text
      expect(current_path).to eq root_path
      expect(Snowflake.count).to eq 0
    end
  end
end
