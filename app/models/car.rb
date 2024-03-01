class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
