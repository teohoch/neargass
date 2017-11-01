class Region < ApplicationRecord
  has_many :provinces
  has_many :communes, :through => :provinces

  scope :nearest, lambda { |latitude, longitude|
    order("ST_Distance(location, ST_GeographyFromText('POINT(#{latitude} #{longitude})'))").limit(1)
  }

  def full_name
    name.include?('De') ? "Region #{name}" : "Region De #{name}"
  end
end
