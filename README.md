# Unidom Price 价格领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-price.svg)](https://badge.fury.io/rb/unidom-price)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Price domain model engine includes Pricing and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。价格领域模型引擎包括定价及其相关的模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-price'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200203.

## Call the Model
```ruby
# Create 2 Prices for the same product
product = Product.create name: 'iPhone 6S'
pricer  = Person.create  name: 'John'
price   = Unidom::Price::Price.create(priced: product,
  pricer:           pricer,
  calculation_code: 'AMNT',
  pricing_code:     'BASE',
  charging_code:    'ONCE',
  currency_code:    'RMB',
  amount:           20.00,
  description:      'the normal price',
  instruction:      'Here is a promotion coming soon.',
  opened_at:        Time.now)
promotion_price = Unidom::Price::Price.create(priced: product,
  pricer:           pricer,
  calculation_code: 'PCNT',
  pricing_code:     'DSCT',
  charging_code:    'ONCE',
  currency_code:    'RMB',
  amount:           15.00,
  description:      'the promotion price',
  instruction:      'Here is a promotion coming 1 week later.',
  opened_at:        Time.now+7.days)

# Find the prices.
prices = Unidom::Price::Price.priced_is(product).priced_by(pricer).charging_coded_as('ONCE').currency_coded_as('RMB').valid_at.alive.first

# Price a product
Unidom::Price::Price.price! product, amount: 100
```



## Include the Concerns
```ruby
include Unidom::Price::Concerns::AsPriced
include Unidom::Price::Concerns::AsPricer
```

### As Priced
The As Priced concern do the following tasks for the includer automatically:  
1. Define the has_many :prices macro as: ``has_many :prices, class_name: 'Unidom::Price::Price', as: :priced``
2. Define the #is_priced! method as: ``is_priced!(amount, by: nil, at: Time.now)``

### As Pricer
The As Priced concern do the following tasks for the includer automatically:  
1. Define the has_many :pricings macro as: ``has_many :pricings, class_name: 'Unidom::Price::Price', as: :pricer``
2. Define the #price! method as: ``price!(it, amount, at: Time.now)``
