require 'spec_helper'

describe User do

  it { is_expected.to have_db_column(:email) }
  it { should validate_presence_of(:email) }
  it 'should have a valid factory' do
    user = FactoryGirl.create(:user) 
  end
  it 'should always have some putty' do
    user = FactoryGirl.create(:user) 
    expect(user.putty).not_to be_nil
  end
end
