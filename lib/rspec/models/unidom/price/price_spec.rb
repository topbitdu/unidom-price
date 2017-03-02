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

    it_behaves_like 'validates', model_attributes, :amount,
      {                            } => 0,
      { amount: nil                } => 2,
      { amount: ''                 } => 2,
      { amount: '1'                } => 0,
      { amount: 1                  } => 0,
      { amount: 'A'                } => 1,
      { amount: '1.23'             } => 0,
      { amount: 1.23               } => 0,
      { amount: '-0.01'            } => 1,
      { amount: -0.01              } => 1,
      { amount: '0'                } => 1,
      { amount: 0                  } => 1,
      { amount: '0.01'             } => 0,
      { amount: 0.01               } => 0,
      { amount: '999_999_999.99'   } => 0,
      { amount: 999_999_999.99     } => 0,
      { amount: '1_000_000_000'    } => 1,
      { amount: 1_000_000_000      } => 1,
      { amount: '1_000_000_000.01' } => 1,
      { amount: 1_000_000_000.01   } => 1

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :calculation, Unidom::Price::Calculation
    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :charging,    Unidom::Price::Charging
    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :pricing,     Unidom::Price::Pricing

  end

end
