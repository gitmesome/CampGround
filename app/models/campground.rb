require 'date'

class Campground < ApplicationRecord
  attr_reader :booked_dates, :price_range

  has_many :campsites

  def booked_dates
    @booked_dates = self.campsites.collect do |site|
      bookings = []
      begin
        self.campsites.each do |booking|
          booking.booked_dates&.split(",").each do |book|
            bookings << DateTime.parse(book).to_date
          end
        end
      rescue NoMethodError
        return []
      end
      bookings
    end
  end

  def price_range
    @price_range = self.campsites.collect { |site| site.price }.minmax
  end

  def to_s
    "#{self.name}"
  end
end
