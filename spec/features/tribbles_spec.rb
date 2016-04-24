require 'spec_helper'

feature 'Tribbles' do
  it 'requires login' do
    visit new_tribble_path

    expect(page.text).to include "You need to sign in or sign up before continuing."
    expect(current_path).to eq new_user_session_path
  end
  context 'when logged in as a user' do
    let(:user) { FactoryGirl.create(:user) }
    before { login_as user }
    after { logout }

    it 'can be created' do
      visit root_path
      click_on 'Create new tribble'
      expect(current_path).to eq new_tribble_path
      fill_in 'tribble_name', with: "Amanda"

      click_on 'Create Tribble'

      expect(Tribble.count).to eq 1
      expect(Tribble.last.name).to eq "Amanda"
      expect(current_path).to eq root_path
    end
    it 'can be created even if one already exists' do
      FactoryGirl.create(:tribble, user: user)
      visit root_path
      click_on 'Create new tribble'
      expect(current_path).to eq new_tribble_path
      fill_in 'tribble_name', with: "Amanda"

      click_on 'Create Tribble'

      expect(Tribble.count).to eq 2
      expect(Tribble.last.name).to eq "Amanda"
      expect(current_path).to eq root_path
    end
    it 'can be deleted' do
      tribble = FactoryGirl.create(:tribble, user: user)
      expect(Tribble.count).to eq 1
      visit root_path

      click_on "Delete #{tribble.name}"

      expect(current_path).to eq root_path
      expect(Tribble.count).to eq 0
    end
    it 'can be edited' do
      tribble = FactoryGirl.create(:tribble, user: user)
      visit root_path
      click_on "Edit #{tribble.name}"
      fill_in 'tribble_name', with: "Amanda"

      click_on 'Update Tribble'

      expect(Tribble.count).to eq 1
      expect(Tribble.last.name).to eq "Amanda"
      expect(current_path).to eq root_path
    end
  end
end
