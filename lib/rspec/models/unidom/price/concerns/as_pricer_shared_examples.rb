shared_examples 'Unidom::Price::Concerns::AsPricer' do |model_attributes, priced|

  before :each do
    @pricer = described_class.create! model_attributes
    @amount = 10.00
  end

  after :each do
  end

  context '#price!' do

    it "should be able to price #{priced.inspect} with amount #{@amount.inspect}" do
      price = @pricer.price! priced, @amount
      expect(price).to     be_present
      expect(price).to     be_a(Unidom::Price::Price)
      expect(price).not_to be_new_record
    end

    it "should be able to price #{priced.inspect} with amount #{@amount.inspect} at #{Time.now.inspect}" do
      price = @pricer.price! priced, @amount, at: Time.now
      expect(price).to     be_present
      expect(price).to     be_a(Unidom::Price::Price)
      expect(price).not_to be_new_record
    end

  end

  context '#price?' do

    it "should be able to price #{priced.inspect} with amount #{@amount.inspect}" do
      expect(@pricer.price? priced).to be_falsey
      @pricer.price!        priced, @amount
      expect(@pricer.price? priced).to be_truthy
    end

    it "should be able to price #{priced.inspect} with amount #{@amount.inspect} at #{Time.now.inspect}" do
      expect(@pricer.price? priced, at: Time.now).to be_falsey
      @pricer.price!        priced, @amount, at: Time.now
      expect(@pricer.price? priced, at: Time.now).to be_truthy
    end

  end

  context do

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

    model  = described_class.create! model_attributes
    amount = 10.00
    it_behaves_like 'assert_present!', model, :price!, [ priced, amount, { at: Time.now } ], [ { 0 => :it }, { 1 => :amount }, :at ]
    it_behaves_like 'assert_present!', model, :price?, [ priced,         { at: Time.now } ], [ { 0 => :it },                   :at ]

  end

end
