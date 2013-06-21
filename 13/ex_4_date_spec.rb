require 'date'

describe Date do
  it 'should have a civil method' do
    require 'date'                         ##(civil
    xmas = Date.civil( 2010, 12, 25 )  ##civil)
    p xmas.to_s
  end

  it 'should have an ordinal method' do
    xmas = Date.ordinal( 2010, 359 )    ##+ord
    p xmas.to_s
  end

  it 'should have a commercial method' do
    xmas = Date.commercial( 2010, 51, 6 )  ##+com
    p xmas.to_s
  end
end
