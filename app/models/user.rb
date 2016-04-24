class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :create_putty

  has_many :tribbles
  has_many :snowflakes
  has_one :diamond
  has_one :putty

  private
  def create_putty
    Putty.create(name: "Squishy Putty", user: self)
  end
end
