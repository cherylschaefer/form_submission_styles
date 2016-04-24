require 'spec_helper'

describe Tribble do

  it { is_expected.to have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it 'validates name uniqueness within a users collection' do
    FactoryGirl.create(:tribble)
      should validate_uniqueness_of(:name).scoped_to(:user_id).with_message("Each tribble owned by a single user must have a unique name")
  end
  it { is_expected.to have_db_column(:user_id) }
  it { should validate_presence_of(:user_id) }
end
