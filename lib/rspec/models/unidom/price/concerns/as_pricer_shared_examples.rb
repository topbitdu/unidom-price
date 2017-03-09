shared_examples 'Unidom::Price::Concerns::AsPricer' do |model_attributes|

  price_1_attribtues = {
      priced_id:   SecureRandom.uuid,
      priced_type: 'Unidom::Price::Priced::Mock',
      amount:      10.00
    }

  price_2_attribtues = {
      priced_id:   SecureRandom.uuid,
      priced_type: 'Unidom::Price::Priced::Mock',
      amount:      21.00
    }

  it_behaves_like 'has_many', model_attributes, :pricings, Unidom::Price::Price, [ price_1_attribtues, price_2_attribtues ]

end
