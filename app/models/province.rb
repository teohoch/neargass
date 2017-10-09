class Province < ApplicationRecord
  belongs_to :region
  def full_name
    "Provincia de #{name}, #{region.full_name}"
  end
end
