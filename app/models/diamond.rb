class Diamond < ActiveRecord::Base
  after_create :assign_random_icon

  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true

  private
  def assign_random_icon
    self.update(image: DIAMOND_ARRAY.sample)
  end
  DIAMOND_ARRAY = ["diamond"]
end
