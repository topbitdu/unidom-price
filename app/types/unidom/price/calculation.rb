class Unidom::Price::Calculation < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_calculation

end
