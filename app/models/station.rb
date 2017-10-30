class Station < ApplicationRecord
  belongs_to :commune
  belongs_to :distributor
  has_many :price_updates

  scope :nearest, lambda { |latitude, longitude|
    order("ST_Distance(location, ST_GeographyFromText('POINT(#{latitude} #{longitude})'))").limit(1)
  }


  def current_price
    a = price_updates.where(current: true)
    a.count>0 ? a.first : nil
  end

  def disallow_updates
    price_updates.each(&:disallow)
  end

  def self.sync_with_cne
    cne_consumer = CNEConsumer.new
    stations = cne_consumer.all
    Station.all.each(&:disallow_updates)

    stations.each do |station|
      commune = Commune.find_by_code(station['id_comuna'])
      distributor = Distributor.find_or_create_by(name: station['distribuidor']['nombre']) do |dis|
        dis.logo = station['distribuidor']['logo']
        dis.logo_svg = station['distribuidor']['logo_svg']
        dis.logo_horizontal_svg = station['distribuidor']['logo_horizontal_svg']
      end

      sta = Station.find_or_create_by(code: station['id']) do |s|
        s.business_name = station['razon_social']
        s.address_street = station['direccion_calle']
        s.address_number = station['direccion_numero']
        s.schedule = station['horario_atencion']
        s.cash = station['metodos_de_pago']['efectivo']
        s.check = station['metodos_de_pago']['cheque']
        s.bank_card = station['metodos_de_pago']['tarjetas bancarias']
        s.shop_card = station['metodos_de_pago']['tarjetas grandes tiendas']
        s.location = "POINT(#{station['ubicacion']['latitud']} #{station['ubicacion']['longitud']})"
        s.shop =  station['servicios']['tienda']
        s.pharmacy = station['servicios']['farmacia']
        s.maintenance = station['servicios']['mantencion']
        s.self_service = station['servicios']['autoservicio']
        s.commune = commune
        s.distributor = distributor
      end

      PriceUpdate.
        create(station: sta,
               gas_93: station['precios'].key?('gasolina 93') ? station['precios']['gasolina 93'] : nil,
               gas_95: station['precios'].key?('gasolina 95') ? station['precios']['gasolina 95'] : nil,
               gas_97: station['precios'].key?('gasolina 97') ? station['precios']['gasolina 97'] : nil,
               diesel: station['precios'].key?('petroleo diesel') ? station['precios']['petroleo diesel'] : nil,
               gnc: station['precios'].key?('gnc') ? station['precios']['gnc'] : nil,
               glp: station['precios'].key?('glp vehicular') ? station['precios']['glp vehicular'] : nil,
               current: true)
    end
  end
end
