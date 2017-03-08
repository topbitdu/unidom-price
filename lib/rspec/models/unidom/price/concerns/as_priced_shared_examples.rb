shared_examples 'Unidom::Price::Concerns::AsPriced' do |model_attributes|

  price_1_attribtues = {
      pricer_id:   SecureRandom.uuid,
      pricer_type: 'Unidom::Price::Pricer::Mock',
      amount:      10.00
    }

  price_2_attribtues = {
      pricer_id:   SecureRandom.uuid,
      pricer_type: 'Unidom::Price::Pricer::Mock',
      amount:      21.00
    }

  it_behaves_like 'has_many', model_attributes, :prices, Unidom::Price::Price, [ price_1_attribtues, price_2_attribtues ]

end
