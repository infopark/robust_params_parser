# Robust Params Parser <sub><sub>by [Infopark](http://www.infopark.com) ![Infopark](https://raw.github.com/infopark/robust_params_parser/master/infopark.jpg)</sub></sub>

Params parser Rack middleware able to handle parsing errors.
Temporary workaround for https://github.com/rails/rails/pull/7424

## Installation

```ruby
  # In your Gemfile
  gem 'robust_params_parser'

  # In your config/application.rb
  config.middleware.swap ActionDispatch::ParamsParser, ::RobustParamsParser, {}
```

## Usage

Just make a POST with Content-Type 'application/json' and an invalid JSON as payload, which
will result in a 400 status code and an empty body response.

## Caveats

Only works if you're using `MultiJson`.

## License

[LGPG-3.0](http://www.gnu.org/licenses/lgpl-3.0.html) License.
Copyright 2013 Infopark AG.
http://www.infopark.com

