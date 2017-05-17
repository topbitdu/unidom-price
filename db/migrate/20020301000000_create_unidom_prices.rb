class CreateUnidomPrices < ActiveRecord::Migration

  def change

    create_table :unidom_prices, id: :uuid do |t|

      t.references :priced, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :pricer, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column :calculation_code, 'char(4)', null: false, default: 'AMNT'
      t.column :pricing_code,     'char(4)', null: false, default: 'BASE'
      t.column :charging_code,    'char(4)', null: false, default: 'ONCE'
      t.column :currency_code,    'char(3)', null: false, default: 'RMB'

      t.decimal :amount, null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: Unidom::Common::STATE
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_prices, :priced_id
    add_index :unidom_prices, :pricer_id

  end

end
