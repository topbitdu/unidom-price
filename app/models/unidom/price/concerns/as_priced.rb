module Unidom::Price::Concerns::AsPriced

  extend ActiveSupport::Concern

  included do |includer|

    has_many :prices, class_name: 'Unidom::Price::Price', as: :priced

  end

  module ClassMethods
  end

end
