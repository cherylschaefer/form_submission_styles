class Snowflake < ActiveRecord::Base
  include RandomIcon

  belongs_to :user
  validates :user_id, presence: true
  validates :name,
            presence: true,
            uniqueness: true
end
