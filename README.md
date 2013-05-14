# Params parser Rack middleware able to handle parsing errors

Temporary workaround for https://github.com/rails/rails/pull/7424

## Caveats

Only works if you're using `MultiJson`.

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

## MIT-License

Copyright 2013 Kostiantyn Kahanskyi

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
