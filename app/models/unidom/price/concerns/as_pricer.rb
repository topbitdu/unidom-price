##
# As Pricer 是定价者的领域逻辑关注点。

module Unidom::Price::Concerns::AsPricer

  extend ActiveSupport::Concern

  included do |includer|

    has_many :pricings, class_name: 'Unidom::Price::Price', as: :pricer

    def price!(it, amount, at: Time.now)

      assert_present! :it,     it
      assert_present! :amount, amount
      assert_present! :at,     at

      pricing = pricings.priced_is(it).valid_at(now: at).alive.first
      pricing.soft_destroy if pricing.present?
      pricings.create! priced: it, amount: amount, opened_at: at

    end

    def price?(it, at: Time.now)

      assert_present! :it, it
      assert_present! :at, at

      pricings.priced_is(it).valid_at(now: at).alive.exists?

    end

  end

  module ClassMethods
  end

end
