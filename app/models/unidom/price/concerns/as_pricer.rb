module Unidom::Price::Concerns::AsPricer

  extend ActiveSupport::Concern

  included do |includer|

    has_many :pricings, class_name: 'Unidom::Price::Price', as: :pricer

    def price!(it, amount, at: Time.now)
      pricing = pricings.priced_is(it).valid_at(now: at).alive.first
      pricing.soft_destroy if pricing.present?
      pricings.create! priced: it, amount: amount, opened_at: at
    end

    def price?(it, at: Time.now)
      pricings.priced_is(it).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
