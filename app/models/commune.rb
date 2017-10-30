class Commune < ApplicationRecord
  belongs_to :province

  def namecode
    {name: full_name, code: code}
  end

  def self.nearest
    arica = Commune.find_by_name('Arica')
    camarones = Commune.find_by_name('Camarones')
    arica.name + camarones.name
  end
end
