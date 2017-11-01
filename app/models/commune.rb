class Commune < ApplicationRecord
  belongs_to :province

  def namecode
    {name: full_name, code: code}
  end
end
