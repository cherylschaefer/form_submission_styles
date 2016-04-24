require 'spec_helper'

feature 'Diamond' do
  it 'requires login' do
    visit new_diamond_path

    expect(page.text).to include "You need to sign in or sign up before continuing."
    expect(current_path).to eq new_user_session_path
  end
  context 'when logged in as a user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { login_as user }
    after(:each) { logout }

    it 'can be created' do
      visit root_path
      click_on 'Create new diamond'
      expect(current_path).to eq new_diamond_path
      fill_in 'diamond_name', with: "Sparkles"

      click_on 'Create Diamond'

      expect(Diamond.count).to eq 1
      expect(Diamond.last.name).to eq "Sparkles"
      expect(current_path).to eq root_path
    end
    it 'can be deleted' do
      diamond = FactoryGirl.create(:diamond, user: user)
      expect(Diamond.count).to eq 1
      visit root_path

      click_on "Delete #{diamond.name}"

      expect(current_path).to eq root_path
      expect(Diamond.count).to eq 0
    end
    it 'can not be edited' do
    end
    it 'can not be created if one already exists' do
    end
  end
end

