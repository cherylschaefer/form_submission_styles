class Tribble < ActiveRecord::Base
  include RandomIcon

  belongs_to :user
  validates :user_id, presence: true
  validates :name,
            presence: true,
            uniqueness: { scope: :user_id, message: "Each tribble owned by a single user must have a unique name" }
end
