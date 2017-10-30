class PriceUpdate < ApplicationRecord
  belongs_to :station

  def disallow
    self.current = false
    save
  end

  def set_as_current
    self.current = true
    save
  end
end
