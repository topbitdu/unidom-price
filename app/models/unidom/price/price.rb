# Price 是价格。
# pricing: 基价(Base)、折扣成分、额外收费成分、厂商建议价。
# charging: 一次性收费、重复性收费、使用率收费。

class Unidom::Price::Price < Unidom::Price::ApplicationRecord

  self.table_name = 'unidom_prices'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 1_000_000_000 }

  belongs_to :priced, polymorphic: true
  belongs_to :pricer, polymorphic: true

  scope :priced_by, ->(pricer) { where pricer: pricer }
  scope :priced_is, ->(priced) { where priced: priced }

  code :calculation, Unidom::Price::Calculation
  code :charging,    Unidom::Price::Charging
  code :pricing,     Unidom::Price::Pricing

  ##
  # 将物品 priced 定价为 amount ， 定价者是 pricer。
  def self.price!(priced, amount: 0, pricer: nil, calculation_code: 'AMNT', pricing_code: 'BASE', charging_code: 'ONCE', opened_at: Time.now)
    price = priced_is(priced).calculation_coded_as(calculation_code).pricing_coded_as(pricing_code).charging_coded_as(charging_code).valid_at.alive.first
    if price.present?
      price.amount = amount
      if pricer.present?
        price.pricer = pricer
      else
        price.pricer_id   = Unidom::Common::NULL_UUID
        price.pricer_type = ''
      end
    else
      attributes = { priced: priced, amount: amount, calculation_code: calculation_code, pricing_code: pricing_code, charging_code: charging_code, opened_at: opened_at }
      if pricer.present?
        attributes[:pricer] = pricer
      else
        attributes[:pricer_id]   = Unidom::Common::NULL_UUID
        attributes[:pricer_type] = ''
      end
      create! attributes
    end
  end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Price::Price'
