class Bike < ActiveRecord::Base
  attr_accessible :description, :name, :price, :user_id, :picture
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality:{greater_than: 0}
  belongs_to :user
  mount_uploader :picture, PictureUploader
  def self.add_bike(name, description, price)
  	b = Bike.create(:name=>name, :description=>description, :price=>price)
  	return b
  end
end
