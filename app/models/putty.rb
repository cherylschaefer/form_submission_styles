class Putty < ActiveRecord::Base
  include RandomIcon

  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true
end
