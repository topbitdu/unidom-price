module Unidom::Price::Concerns::AsPriced

  extend ActiveSupport::Concern

  included do |includer|

    has_many :prices, class_name: 'Unidom::Price::Price', as: :priced

    def is_priced!(amount, by: nil, at: Time.now)
      pricing = prices.valid_at(now: at).alive.first
      pricing.soft_destroy if pricing.present?
      prices.create! pricer: by, amount: amount, opened_at: at
    end

    def is_priced?(at: Time.now)
      prices.valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
