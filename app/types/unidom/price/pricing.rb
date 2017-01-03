class Unidom::Price::Pricing < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_pricing

end
