##
# As Priced 是被定价物品的领域逻辑关注点。

module Unidom::Price::Concerns::AsPriced

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :prices, class_name: 'Unidom::Price::Price', as: :priced

    def is_priced!(amount, by: nil, at: Time.now)

      assert_present! :amount, amount
      assert_present! :by,     by
      assert_present! :at,     at

      pricing = prices.valid_at(now: at).alive.first
      pricing.soft_destroy if pricing.present?
      prices.create! pricer: by, amount: amount, opened_at: at

    end

    def is_priced?(at: Time.now)

      assert_present! :at, at

      prices.valid_at(now: at).alive.exists?

    end

  end

  module ClassMethods
  end

end
