describe Unidom::Price::Charging, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 3, [
    { code: 'ONCE', name: 'one_time',    localized_name: '一次性收费'   },
    { code: 'RECR', name: 'recurring',   localized_name: '重复性收费' },
    { code: 'UTLZ', name: 'utilization', localized_name: '使用率收费' } ]

end
