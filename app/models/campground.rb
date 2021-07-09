require 'date'

class Campground < ApplicationRecord
  attr_reader :campsites, :booked_dates, :price_range

  has_many :campsite

  def campsites
    @campsites = self.campsites.collect { |site| site.name }
  end

  def booked_dates
    @booked_dates = self.campsites.collect do |site|
      bookings = []
      self.campsites.booked_dates.split(",").each do |booking|
        bookings << DateTime.parse(booking).to_date
      end
      bookings
    end
  end

  def price_range
    @price_range = self.campsites.collect { |site| site.price }.minmax
  end
end
