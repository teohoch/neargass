describe 'CNE Consumer'  do
  before(:all) do
    @consumer = CNEConsumer.new
    @consumer2 = CNEConsumer.new('')
    WebMock.allow_net_connect!
  end

  it 'should raise argument error when not provided location codes' do
    expect{@consumer.gas_stations_by_location()}.to raise_error(ArgumentError)
  end
  it 'should raise runtime error when the server gives any code except 200' do
    expect{@consumer2.gas_stations_by_location(commune:'05602')}.to raise_error(RuntimeError)
  end

  it 'should return a JSON Hash when the request succeeds' do
    result = @consumer.gas_stations_by_location(commune:'05602')
    expect(result).to be_a_kind_of Hash
  end
end