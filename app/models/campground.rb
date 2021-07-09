class Campground < ApplicationRecord
  attr_reader :campsites, :booked_dates, :price_range

  has_many :campsites

  def campsites
    @campsites = :placeholder
  end

  def booked_dates
    @booked_dates = :placeholder
  end

  def price_range
    @price_range = :placeholder
  end
end
