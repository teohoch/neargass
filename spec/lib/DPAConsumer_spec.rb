require 'webmock/rspec'

describe "DPA Consumer" do
  before(:all) do
    @consumer = DPAConsumer.new
  end
  context 'regions' do
    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, 'http://apis.modernizacion.cl/dpa/regiones').
        to_return(status: 500)
      expect{@consumer.regions}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.regions
      expect(result).to be_a_kind_of Array
    end
  end

  context 'provinces' do
    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, 'http://apis.modernizacion.cl/dpa/provincias').
        to_return(status: 500)
      expect{@consumer.provinces}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.provinces
      expect(result).to be_a_kind_of Array
    end
  end

  context 'communes' do
    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, 'http://apis.modernizacion.cl/dpa/comunas').
        to_return(status: 500)
      expect{@consumer.communes}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.communes
      expect(result).to be_a_kind_of Array
    end

  end

  context 'communes_in_province' do
    before(:all) do
      @province_code = '058'
    end

    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, "http://apis.modernizacion.cl/dpa/provincias/#{@province_code}/comunas/").
          to_return(status: 500)
      expect{@consumer.communes_in_province(@province_code)}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.communes_in_province(@province_code)
      expect(result).to be_a_kind_of Array
    end

  end

  context 'provinces_in_region' do
    before(:all) do
      @region_code = '05'
    end

    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, "http://apis.modernizacion.cl/dpa/regiones/#{@region_code}/provincias/")
        .to_return(status: 500)
      expect{@consumer.provinces_in_region(@region_code)}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.provinces_in_region(@region_code)
      expect(result).to be_a_kind_of Array
    end
  end

  context 'communes_in_region' do
    before(:all) do
      @region_code = '05'
    end

    it 'should raise runtime error when the server gives any code except 200' do
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, "http://apis.modernizacion.cl/dpa/regiones/#{@region_code}/comunas/")
          .to_return(status: 500)
      expect{@consumer.communes_in_region(@region_code)}.to raise_error(RuntimeError)
    end

    it 'should return a Array when the request succeeds' do
      WebMock.allow_net_connect!
      result = @consumer.communes_in_region(@region_code)
      expect(result).to be_a_kind_of Array
    end
  end
end