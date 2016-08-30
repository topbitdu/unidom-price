module Unidom::Price::Concerns::AsPricer

  extend ActiveSupport::Concern

  included do |includer|

    has_many :pricings, class_name: 'Unidom::Price::Price', as: :pricer

  end

  module ClassMethods
  end

end
