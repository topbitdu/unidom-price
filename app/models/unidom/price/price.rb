# Price 是价格。

class Unidom::Price::Price < ActiveRecord::Base

  self.table_name = 'unidom_prices'

  validates :amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }

  belongs_to :priced, polymorphic: true
  belongs_to :pricer, polymorphic: true

  scope :priced_by, ->(pricer) { where pricer: pricer }
  scope :priced_is, ->(priced) { where priced: priced }

  include Unidom::Common::Concerns::ModelExtension

end
