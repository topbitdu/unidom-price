shared_examples 'Unidom::Price::Concerns::AsPriced' do |model_attributes, pricer|

  before :each do
    @priced = described_class.create! model_attributes
    @amount = 10.00
  end

  after :each do
  end

  context '#is_priced!' do

    #it 'should reject the amount argument = nil' do expect { @priced.is_priced! nil,     by: pricer, at: Time.now }.to raise_error(ArgumentError, 'The amount argument is required.') end
    #it 'should reject the by argument = nil'     do expect { @priced.is_priced! @amount, by: nil,    at: Time.now }.to raise_error(ArgumentError, 'The by argument is required.')     end
    #it 'should reject the at argument = nil'     do expect { @priced.is_priced! @amount, by: pricer, at: nil      }.to raise_error(ArgumentError, 'The at argument is required.')     end

    it "should be able to be priced by #{pricer.inspect}" do
      price = @priced.is_priced! @amount, by: pricer
      expect(price).to     be_present
      expect(price).to     be_a(Unidom::Price::Price)
      expect(price).not_to be_new_record
    end

    it "should be able to be priced by #{pricer.inspect}, at #{Time.now.inspect}" do
      price = @priced.is_priced! @amount, by: pricer, at: Time.now
      expect(price).to     be_present
      expect(price).to     be_a(Unidom::Price::Price)
      expect(price).not_to be_new_record
    end

  end

  context '#is_priced?' do

    #it 'should reject the at argument = nil' do expect { @priced.is_priced? at: nil }.to raise_error(ArgumentError, 'The at argument is required.') end

    it "should be able to be priced by #{pricer.inspect}" do
      expect(@priced.is_priced?).to be_falsey
      @priced.is_priced! @amount, by: pricer
      expect(@priced.is_priced?).to be_truthy
    end

    it "should be able to be priced by #{pricer.inspect}, at #{Time.now.inspect}" do
      expect(@priced.is_priced?   at: Time.now).to be_falsey
      @priced.is_priced! @amount, by: pricer, at: Time.now
      expect(@priced.is_priced?   at: Time.now).to be_truthy
    end

  end

  context do

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

    model  = described_class.create! model_attributes
    amount = 10.00
    it_behaves_like 'assert_present!', model, :is_priced!, [ amount, { by: pricer, at: Time.now } ], [ { 0 => :amount }, :by, :at ]
    it_behaves_like 'assert_present!', model, :is_priced?, [         {             at: Time.now } ], [                        :at ]

  end

end
