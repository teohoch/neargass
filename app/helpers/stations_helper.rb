module StationsHelper
  def to_currency(input)
    input.nil? ? nil : number_to_currency(input.to_i)
  end
end
