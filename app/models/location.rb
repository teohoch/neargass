class Location
  extend ActiveModel::Naming

  attr_accessor :type_code, :id, :object

  def initialize(args)
    self.type_code=args[:type_code]
    self.id=args[:id]
    self.object=Location.find(args)
  end

  def self.all
    Commune.all
  end

  def self.find(param)
    type = 2
    if param.is_a?(Hash)
      if param.has_key?(:type_code)
        type = param[:type_code]
      end
      if param.has_key?(:id)
        id = param[:id]
      else
        raise ArgumentError, 'Arguments must contain an :id key'
      end
    else
      id = param
    end
    Location.select_class(type).find(id)
  end

  def to_param
    "#{type_code}-#{id}"
  end

  def to_model
    # You will get to_model error, if you don't have this dummy method
  end

  def persisted?
    false
  end

  def self.select_class(type_code)
    case type_code
      when 0
        Region
      when 1
        Province
      when 3
        Commune
      else
        raise 'Type code must be in range 0 to 2'
    end
  end
end
