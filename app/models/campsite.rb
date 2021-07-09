class Campsite < ApplicationRecord
  belongs_to :campground

  def to_s
    "#{self.name}"
  end
end
