require 'spec_helper'

feature 'Putty' do
  it 'requires login' do
    FactoryGirl.create(:user)
    visit edit_putty_path(Putty.last)

    expect(page.text).to include "You need to sign in or sign up before continuing."
    expect(current_path).to eq new_user_session_path
  end
  context 'when logged in as a user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { login_as user }
    after(:each) { logout }

    it 'can be edited' do
      putty = user.putty
      visit root_path
      click_on "Edit #{putty.name}"
      fill_in 'putty_name', with: "Red Putty"

      click_on 'Update Putty'

      expect(Putty.count).to eq 1
      expect(Putty.last.name).to eq "Red Putty"
      expect(current_path).to eq root_path
      expect(Putty.last.image).not_to be_nil
    end
    it 'can not be deleted' do
      skip('TODO')
    end
    it 'can not be created' do
      skip('TODO')
    end
  end
end

