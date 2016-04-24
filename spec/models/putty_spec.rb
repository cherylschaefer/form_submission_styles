require 'spec_helper'

describe Putty do

  it { is_expected.to have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { is_expected.to have_db_column(:user_id) }
  it { should validate_presence_of(:user_id) }
end
