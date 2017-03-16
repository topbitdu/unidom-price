describe Unidom::Price::Price, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      priced_id:        SecureRandom.uuid,
      priced_type:      'Unidom::Price::Priced::Mock',
      pricer_id:        SecureRandom.uuid,
      pricer_type:      'Unidom::Price::Pricer::Mock',
      calculation_code: 'AMNT',
      pricing_code:     'BASE',
      charging_code:    'ONCE',
      currency_code:    'RMB',
      amount:           10.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :amount,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :calculation, Unidom::Price::Calculation
    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :charging,    Unidom::Price::Charging
    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :pricing,     Unidom::Price::Pricing

  end

end
