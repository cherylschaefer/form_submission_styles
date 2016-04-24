require 'spec_helper'

feature "Users" do
  it 'can register' do
    expect(User.all.count).to eq 0
    user_hash = FactoryGirl.attributes_for(:user)
    visit root_path
    click_on "Sign up"
    fill_in 'user_email', with: user_hash[:email]
    fill_in 'user_password', with: user_hash[:password]
    fill_in 'user_password_confirmation', with: user_hash[:password]

    click_on "Sign up"

    expect(User.all.count).to eq 1
    expect(current_path).to eq root_path
    expect(page.text).to include "You are signed in."
    expect(User.last.email).to eq user_hash[:email]
  end
  it 'can sign in' do
    user = FactoryGirl.create(:user)
    expect(User.all.count).to eq 1
    visit root_path
    click_on 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_on 'Log in'

    expect(User.all.count).to eq 1
    expect(current_path).to eq root_path
    expect(page.text).to include "You are signed in."
    expect(User.last.email).to eq user.email
  end
end
