describe Unidom::Price::Pricing, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 4, [
    { code: 'BASE', name: 'base',                   localized_name: '基价'         },
    { code: 'DSCT', name: 'discount',               localized_name: '折扣成分'     },
    { code: 'SCHG', name: 'surcharge',              localized_name: '额外收费成分' },
    { code: 'MFSG', name: 'manufacturer_suggested', localized_name: '厂家建议价'   } ]

end
