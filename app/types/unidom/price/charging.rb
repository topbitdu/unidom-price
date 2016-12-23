class Unidom::Price::Charging < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_charging

end
