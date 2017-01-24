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

  end

end
