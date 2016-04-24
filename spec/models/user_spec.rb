require 'spec_helper'

describe User do

  it { is_expected.to have_db_column(:email) }
  it { should validate_presence_of(:email) }

  it 'should have a valid factory' do
    user = FactoryGirl.create(:user) 
  end
end
