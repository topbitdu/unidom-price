# Unidom Price 价格领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-price.svg)](https://badge.fury.io/rb/unidom-price)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Price domain model engine includes Pricing and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。价格领域模型引擎包括定价及其相关的模型。

## Usage in Gemfile
```ruby
gem 'unidom-price'
```

## Run the Database Migration
```shell
rake db:migrate
```

## Call the Model
```ruby
Unidom::Price::Price.valid_at.alive.first
```
