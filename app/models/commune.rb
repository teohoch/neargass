class Commune < ApplicationRecord
  belongs_to :province
  def full_name
    "#{name}, #{province.full_name}"
  end
end
