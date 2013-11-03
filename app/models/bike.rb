class Bike < ActiveRecord::Base
  attr_accessible :description, :name, :price, :user_id
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  belongs_to :user

  def self.add_bike(name, description, price)
  	b = Bike.create(:name=>name, :description=>description, :price=>price)
  	return b
  end
end
