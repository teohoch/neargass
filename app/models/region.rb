class Region < ApplicationRecord
  def full_name
    name.include?('De') ? "Region #{name}" : "Region De #{name}"
  end
end
