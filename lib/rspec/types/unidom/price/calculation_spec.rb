describe Unidom::Price::Calculation, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 2, [
    { code: 'AMNT', name: 'amount',     localized_name: '金额'   },
    { code: 'PCTG', name: 'percentage', localized_name: '百分比' } ]

end
