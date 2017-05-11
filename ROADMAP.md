# Unidom Price Roadmap 价格领域模型引擎路线图

## v0.1
1. Price model & migration (20020301000000)

## v0.2
1. Improve the Price model to include the Model Extension concern

## v0.3
1. Improve the Price model to add the .``price!`` method
2. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improve the Price model to support the Keyword Arguments

## v1.0.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Priced concern
2. As Pricer concern

## v1.2
1. Improve the As Priced concern to add the #``is_priced!`` method
2. Improve the As Pricer concern to add the #``price!`` method

## v1.3
1. Improve the As Priced concern to add the #``is_priced?`` method
2. Improve the As Pricer concern to add the #``price?`` method

## v1.3.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.3.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.4
1. Improve the Ruby Gem Specification to depend on [progne_tapera](https://github.com/topbitdu/progne_tapera) v0.3
2. Calculation enum code
3. Improve the Price model to configure the Calculation enum code

## v1.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1
2. Improve the Ruby Gem Specification to never depend on [progne_tapera](https://github.com/topbitdu/progne_tapera)

## v1.5
1. Charging enum code
2. Improve the Price model to configure the Charging enum code

## v1.6
1. Pricing enum code
2. Improve the Price model to configure the Pricing enum code

## v1.6.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension

## v1.6.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.7
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.7.1
1. Improve the Price spec for the validations on the #``amount`` attribute

## v1.7.2
1. Improve the Price model to configure the Pricing enum code
2. Improve the Price model for the validations on the #``amount`` attribute
3. Improve the Price spec for the validations on the #``calculation_code`` attribute, the #``charging_code`` attribute, & the #``pricing_code`` attribute

## v1.7.3
1. As Priced shared examples
2. As Pricer shared examples
3. RSpec shared examples manifest

## v1.7.4
1. Improve the Price model for the validations on the #``amount`` attribute
2. Improve the Price spec for the validations on the #``amount`` attribute

## v1.7.5
1. Improve the As Priced shared examples for the #is_priced! method, & the #is_priced? method
2. Improve the As Priced concern for the argument validation

## v1.7.6
1. Improve the As Priced shared examples for the #is_priced! method, & the #is_priced? method
2. Improve the Price model for the argument validation

## v1.7.7
1. Improve the As Pricer concern for the argument validations of the #price! method, & the #price? method
2. Improve the As Pricer shared examples for the argument validations of the #price! method, & the #price? method

## v1.7.8
1. Improve the As Pricer shared examples for the #price! method, & the #price? method

## v1.7.9
1. Improve the Ruby Gem Specification to depend on unidom-common v1.10
2. Improve the Price migration for the #opened_at column, & the #closed_at column
